# MFD

This is an MFD that has 3 pages of buttons that can toggle other buttons or states.

## Features
1. 12 buttons can be used in total, 3 pages of 4 buttons.
1. Uses a state machine to remember what page it is on.
1. When it goes to a new page it will update the button states as needed.
1. Can be modded to add more pages like ISAN display, or other functionality.

## Limitations
This MFD has abolute control over what ever functions is on it's current page. The way around this is when you want to change, for say a button, that the MFD is "looking" at on it's page. You have to check if the MFD is on it's particular page and update the corresponding button.

Example work around:

```
// Turn off
if :MP=2 then
    :R2=0
else
    :f8=0
end
// Turn on
if :MP=2 then
    :R2=1
else
    :f8=1
end
```

## Requirements
3 basic Yolol Chips

1 Memory Chip

* Change the name of `ChipField1` to `P1`
* Change the name of `ChipField2` to `P2`
* Change the name of `ChipField3` to `P3`
* or any other one below these if you have space


1 Text Panel

* Change the name of `PanelValue` to `MD`

6 Simple Buttons

* Change the name of `ButtonState` to `L1`
* Change the name of `ButtonState` to `L2`
* Change the name of `ButtonState` to `R1`
* Change the name of `ButtonState` to `R2`
* Change the name of `ButtonState` to `MPP`
* Change the name of `ButtonState` to `MPN`

1 Progress bar 12×24

* Change the name of `PanelValue` to `MP`

## How to setup the MFD panel
1. Place `L1` and `L2` to the left of `MD` and `R1` and `R2` to the right of `MD`
2. Place `MPP` to the left of `MP` and `MPN` to the right of `MP`

It should be aranged something like this:

```
L1  |MD| R1
L2  |  | R2
MPP  MP  MPN
```

## How to add your functions
1. Open `state_common.nolol` in your favorite editor, VSCode is what I use.
1. Where is shows `define :Func1=:f1`, change `f1` to match your button or other togglable property(0 or 1).
1. If you have the vscode-yolol extentions installed press Control+Shift+P and look for `YODK: Compile NOLOL-Code`. This will compile the nolol code into yolol code for you.
1. If you use another editor, then you will need to install [yodk](https://dbaumgarten.github.io/yodk/#/?id=installation) and run `yodk compile Functions.nolol` at the command line.
1. Do this for `Display.nolol` and `PageControl.nolol`
1. (Optional) Open `Compile-Memory.ps1` in your favorite editor, VSCode is what I use.
1. (Optional) Where is shows below are your page screens, edit these lines to match your functions
```
< f1
f3 >
< f2
f4 >
```
1. (Optional) Then open up a PowerShell window and `cd` to the `tools` folder and run `powershell .\Compile-Memory.ps1`
1. Open up the `memory.txt` file and look at the bottom. You will see `P1=`, `P2=`, and `P3=` lines. These are what you need to set the values in your memory chip. If you skipped the (Optional) parts then just edit these to match your needs.
1. Copy `Functions.yolol`, `Display.yolol`, and `PageControl.yolol` into their own yolol chips.

## Support

You can create an issue here on GitHub, hit me up on discord on the Starbase discord server as Spyingwind, or PM/Mail in game as Spyingwind.
