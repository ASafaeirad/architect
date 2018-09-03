// -- hyper-stylesheet-hash:a05582eeed861ad51d27c29bbb3c9304 --
// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // update channel [stable, canary]
    updateChannel: "stable",

    // fonts
    fontFamily: '"Meslo LG L for Powerline", "Operator Mono", monospace',    
    fontSize: 12,
    fontWeight: 'normal',
    fontWeightBold: 'bold',

    // cursor [`BEAM`, `UNDERLINE`, `BLOCK`]
    cursorShape: 'BLOCK',
    cursorColor: 'rgba(248,28,229,0.8)',
    cursorAccentColor: '#f00',
    cursorBlink: false,
    selectionColor: 'rgba(248,28,229,0.3)',

    // style
    foregroundColor: '#fff',
    backgroundColor: '#222',
    borderColor: '#333',
    css: '',
    termCSS: '',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: 'true',
    padding: '12px 14px', // custom padding (css format, i.e.: `top right bottom left`)

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: '#ff0000',
      green: '#33ff00',
      yellow: '#ffff00',
      blue: '#0066ff',
      magenta: '#cc00ff',
      cyan: '#00ffff',
      white: '#d0d0d0',
      lightBlack: '#808080',
      lightRed: '#ff0000',
      lightGreen: '#33ff00',
      lightYellow: '#ffff00',
      lightBlue: '#0066ff',
      lightMagenta: '#cc00ff',
      lightCyan: '#00ffff',
      lightWhite: '#ffffff'
    },

    // shell
    shell: '',
    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login', '-i'],
    env: {},

    bell: 'SOUND', // set to false for no bell
    copyOnSelect: false, // if true, selected text will automatically be copied to the clipboard

    // hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    // on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    quickEdit: true,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
    // Plugins
    summon: {
      hideDock: true,
      hideOnBlur: false,
      hotkey: 'CommandOrControl+`'
    },

    hyperTabs: {
      trafficButtons: false,
      border: false,
      tabIcons: true,
      activityPulse: true,
      tabIconsColored: false,
      activityColor: '#000',
      closeAlign: 'right',
    },
  },

  plugins: [
    'hyper-chesterish',
    'hyperterm-summon',
    'hyper-tabs-enhanced',
    // 'hyper-sync-settings',
    // 'hyperterm-gruvbox-dark'
    // 'hyperlayout',
  ],

  localPlugins: [],

  keymaps: {
    'pane:next': 'alt+right',
    'pane:prev': 'alt+left',
    'pane:splitVertical': 'ctrl+alt+right',
    'pane:splitHorizontal': 'ctrl+alt+down',
  },
};
