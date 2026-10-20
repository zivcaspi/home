# Sync folder

The `sync` folder manages synchronizing files across machines.
Every top-level folder inside the `sync` folder is a set of files that get synchronized to some other folder on the same machine.
For example, the `localappdata` folder is synchronized to the local machine's `%LOCALAPPDATA%` folder.
A command-line tool is used to sync the `sync` folder's contents to the local machine's, or back.
