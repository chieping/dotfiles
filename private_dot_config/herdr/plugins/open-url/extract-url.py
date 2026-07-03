import json, os, re, subprocess

text = ""

ctx = json.loads(os.environ.get("HERDR_PLUGIN_CONTEXT_JSON", "{}"))
text = ctx.get("selected_text") or ctx.get("selection") or ""

if not text:
    text = subprocess.run(["pbpaste"], capture_output=True, text=True).stdout.strip()

m = re.search(r'https?://[^\s\'"<>)]+', text)
print(m.group(0).rstrip(".,;:") if m else "")
