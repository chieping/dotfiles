// https://github.com/brookhong/Surfingkeys
// url: https://raw.githubusercontent.com/chieping/dotfiles/master/surfingkeys.js

/* eslint-disable no-undef, strict */

// an example to create a new mapping `ctrl-y`
mapkey('<Ctrl-y>', 'Show me the money', function() {
    Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
});

// an example to replace `u` with `?`, click `Default mappings` to see how `u` works.
map('?', 'u');

// an example to remove mapkey `Ctrl-i`
unmap('<Ctrl-i>');

settings.theme = '\
.sk_theme { \
    background: #fff; \
    color: #000; \
} \
.sk_theme tbody { \
    color: #000; \
} \
.sk_theme input { \
    color: #000; \
} \
.sk_theme .url { \
    color: #555; \
} \
.sk_theme .annotation { \
    color: #555; \
} \
.sk_theme .focused { \
    background: #f0f0f0; \
}';

settings.smoothScroll = false;

// Blacklist
settings.blacklist = {
    "ssh.cloud.google.com": 1
}

// Search

// remove default google search
removeSearchAliasX('g', 'o');
unmap('sg');

addSearchAliasX('gj', 'google(ja)', 'https://www.google.com/search?lr=lang_ja&as_q=');
mapkey('ogj', '#8Open Search in google(ja)', 'Front.openOmnibar({type: "SearchEngine", extra: "gj"})');

addSearchAliasX('ge', 'google(en)', 'https://www.google.com/search?lr=lang_en&as_q=');
mapkey('oge', '#8Open Search in google(en)', 'Front.openOmnibar({type: "SearchEngine", extra: "ge"})');

addSearchAliasX('a', 'alc', 'http://eow.alc.co.jp/search?ref=sa&q=');
mapkey('oa', '#8Open Search in Alc', 'Front.openOmnibar({type: "SearchEngine", extra: "a"})');

addSearchAliasX('gt', 'google translate(en-ja)', 'https://translate.google.com/#en/ja/');
mapkey('ogt', '#8Open Translation in google translate(en-ja)', 'Front.openOmnibar({type: "SearchEngine", extra: "gt"})');

// vim:set ts=4 sw=4 sts=4:
