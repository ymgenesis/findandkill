# findandkill
Simple bash script for Linux/macOS to find and terminate processes based on a given user string.

## Usage
`findandkill.sh [string]`

where `[string]` is any keyword given by the user to search for processes.

A list of processes matching `[string]` will be presented using `ps aux`, and the user will be asked to verify (y or n) that these processes are to be terminated. If y, processes matching `[string]` will be terminated. If n, the script will exit.

If no running processes match `[string]`, and the user chooses y, the script will exit.

If more than one-or no-`[string]` arguments are given, the script will exit.

## Terminating root processes
non-root users cannot kill processes belonging to root. To do so, run the script using sudo:

`sudo /path/to/script/findandkill.sh [string]`

Or, login as root and run the script.

## Examples
```
findandkill sleep
USER     PID   0.0  0.0  4267964    700 s001  S     1:32pm   0:00.00 sleep 3600
USER     PID   0.0  0.0  4267964    700 s001  S     1:32pm   0:00.00 sleep 3600
USER     PID   0.0  0.0  4267964    700 s001  S     1:32pm   0:00.00 sleep 3600
USER     PID   0.0  0.0  4267964    700 s001  S     1:32pm   0:00.00 sleep 3600

The above process(es) will be terminated. Are you sure [y/n]? y
Terminating processes matching sleep...
Success! All processes matching sleep were terminated.
```
```
findandkill too many arguments
Too many arguments. One at a time.
```
```
findandkill noprocesscalledthis

The above process(es) will be terminated. Are you sure [y/n]? y
Terminating processes matching noprocesscalledthis...
Failed. Either no running process(es) matching noprocesscalledthis, or process(es) noprocesscalledthis belong(s) to root.
```

## Troubleshooting
First, make script executable:

`sudo chmod +x /path/to/script/findandkill.sh)`

Then, try again:

`./path/to/script/findandkill.sh`
