{ config, inputs, outputs, pkgs, ... }:
{
home.file.".config/rofi/rounded-common.rasi".text = ''

/*******************************************************************************
 * ROUNDED THEME FOR ROFI 
 * User                 : LR-Tech               
 * Theme Repo           : https://github.com/lr-tech/rofi-themes-collection
 *******************************************************************************/

*{
    bg0:    #${config.colorScheme.colors.base00};
    bg1:    #${config.colorScheme.colors.base01};
    bg2:    #${config.colorScheme.colors.base02};
    bg3:    #${config.colorScheme.colors.base03};
    fg0:    #${config.colorScheme.colors.base04};
    fg1:    #${config.colorScheme.colors.base04};
    fg2:    #${config.colorScheme.colors.base04};
    fg3:    #${config.colorScheme.colors.base04};

}

* {
    font:   "Roboto 12";

    background-color:   transparent;
    text-color:         @fg0;

    margin:     0px;
    padding:    0px;
    spacing:    0px;
}

window {
    location:       center;
    width:          480;
    border-radius:  24px;
    
    background-color:   @bg0;
}

mainbox {
    padding:    12px;
}

inputbar {
    background-color:   @bg1;
    border-color:       @bg3;

    border:         2px;
    border-radius:  16px;

    padding:    8px 16px;
    spacing:    8px;
    children:   [ prompt, entry ];
}

prompt {
    text-color: @fg2;
}

entry {
    placeholder:        "Search";
    placeholder-color:  @fg3;
}

message {
    margin:             12px 0 0;
    border-radius:      16px;
    border-color:       @bg2;
    background-color:   @bg2;
}

textbox {
    padding:    8px 24px;
}

listview {
    background-color:   transparent;

    margin:     12px 0 0;
    lines:      8;
    columns:    1;

    fixed-height: false;
}

element {
    padding:        8px 16px;
    spacing:        8px;
    border-radius:  16px;
}

element normal active {
    text-color: @bg3;
}

element selected normal, element selected active {
    background-color:   @bg3;
}

element-icon {
    size:           1em;
    vertical-align: 0.5;
}

element-text {
    text-color: inherit;
}
'';

}