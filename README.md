# EDAutoPanelNavigation
A small set of AHK scripts designed to be integrated with voice command software for the purpose of navigating to any internal or external panel tab with a single voice command.
# Setup and Usage
AHK must be installed in order for the scripts to run.

Once you have extracted the files to your desired location, running "script setup.ahk" will provide you with a simple setup and calibration process.

When setup has finished, all .txt files in /MainScripts MUST have their file extensions changed to .ahk (this step will likely not be needed in later versions.)

To use these scripts, create a new voice command in your preferred software for the tab you want to navigate to and set it to run the script that starts with the name of the desired tab. For example, to open the navigation tab, the voice command should launch "navigation tab.ahk"
# To do
Add support for all tabs

Reduce duration of Sleep as much as possible

<strike>Simplify voice command integration to only require launching a single script per tab</strike> Done!

<strike>Overhaul setup to allow easier recalibration and to eliminate manual changing of file extensions</strike> Done!

Remove unnecessary buttons and add images in setup steps
