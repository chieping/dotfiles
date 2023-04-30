#!/usr/bin/env python
# https://rsk0315.hatenablog.com/entry/2022/09/19/200454
import asyncio
import os
import sys

[CONTESTANT, JUDGE] = range(2)
COLUMNS = os.get_terminal_size().columns

def usage():
    print('example usage: sniff_reactive.py python main.py -- python judge.py')


def output(left, right, *, preleft='', preright=''):
    wl = COLUMNS // 2 - 4
    wr = (COLUMNS - 1) // 2 - 4

    if not left and not right:
        print(f' +-{"-" * wl}-+-{"-" * wr}-+')
        return

    if left and right:
        preleft = preright = '\x1b[1;37m'

    postleft = '\x1b[m' if preleft else ''
    postright = '\x1b[m' if preright else ''

    print(f' |{preleft} {left:{wl}} {postleft}|{preright} {right:{wr}} {postright}|')


async def listen(read, write, who, proc):
    while proc.returncode is None:
        content = await asyncio.to_thread(read.readline)
        if content:
            contents = ['', '']
            contents[who] = content.rstrip('\n')
            output(*contents)
            print(content, end='', flush=True, file=write)


async def sniff(c_read, j_read, c_write, j_write, c_proc, j_proc):
    with open(c_read, 'w') as w_c_read:
        with open(j_read, 'w') as w_j_read:
            with open(c_write, 'r') as r_c_write:
                with open(j_write, 'r') as r_j_write:
                    await asyncio.gather(
                        listen(r_c_write, w_j_read, CONTESTANT, c_proc),
                        listen(r_j_write, w_c_read, JUDGE, j_proc),
                    )


async def main():
    paths = ['cr.pipe', 'jr.pipe', 'cw.pipe', 'jw.pipe']
    [c_read, j_read, c_write, j_write] = paths
    for path in paths:
        if os.path.exists(path):
            os.remove(path)
        os.mkfifo(path)

    sep = sys.argv.index('--')
    contestant_command = ' '.join(sys.argv[1:sep]) + f' < {c_read} > {c_write}'
    judge_command = ' '.join(sys.argv[sep+1:]) + f' < {j_read} > {j_write}'

    output('', '')
    output('contestant', 'judge')
    output('', '')

    devnull = asyncio.subprocess.DEVNULL
    c_proc = await asyncio.create_subprocess_shell(contestant_command, shell=True, stderr=devnull)
    j_proc = await asyncio.create_subprocess_shell(judge_command, shell=True, stderr=devnull)

    await asyncio.gather(
        sniff(c_read, j_read, c_write, j_write, c_proc, j_proc),
        c_proc.communicate(),
        j_proc.communicate(),
    )

    if c_proc.returncode != 0:
        output('', 'RE', preright='\x1b[1;91m')
    elif j_proc.returncode != 0:
        output('', 'WA', preright='\x1b[1;91m')
    else:
        output('', 'AC', preright='\x1b[1;92m')

    output('', '')

    for path in paths:
        os.remove(path)


if __name__ == '__main__':
    if '--' not in sys.argv:
        usage()
        exit()

    asyncio.run(main())
