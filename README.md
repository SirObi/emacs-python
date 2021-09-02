## Installation (Linux/MacOS)
`cd` (go to your user root)  
`rm -rf .emacs.d`  (remove existing Emacs config, if any)  
`git clone git@github.com:SirObi/emacs-python.git .emacs.d`

Launch Emacs and run:  
`M-x jedi:install-server`  


## Running  
It's best to `cd` to the folder you want to open with Emacs and then 

### Linux  
`emacs .`  

### MacOS
`open -a Emacs.app .`

You can alias either to `e .` in you shell config file (like `.zshrc` or `.bashrc`).  
