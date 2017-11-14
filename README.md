# vimrc
This project records jeremy's vimrc configuration in Ubuntu x64. All the plugins are managed using [Vundle](https://github.com/VundleVim/Vundle.vim). 

The plugins include [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for auto completion(python & c-family)， code error check (c-family), and [multiple cursor](https://github.com/terryma/vim-multiple-cursors). Other basic vim configurations are set as well.

### Vundle Installation
Follow the installation step introduced in [Vundle](https://github.com/VundleVim/Vundle.vim).

1. git clone

	```
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	```

2. Set Configure Plugins

	Put the configuration at the top of your ```.vimrc```. You can follow the vimrc file.
	
3. Install Plugins
	Launch ```vim``` and run ```:PluginInstall```
	
***
### YouCompleteMe Installation
I suggest you follow the [Full Installation Guild]() strictly, especially for the semantic support of C-family. 

**Tips:Follow the instructions of YouCompleteMe, READ EVERY WORD OF THE GUILD**

I conclude the installation step briefly, it works well for me in Ubuntu 16.04, Python 2.7. Make sure you have Vim 7.4 at least, and with Vundle installed.

**1.Development Tools Installation**

```
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
```

Compiling YCM with semantic support for C-family

```
cd ~/.vim/bundle/
git clone --recursive https://github.com/Valloric/YouCompleteMe.git
cd ./YouCompleteMe
./install.py --clang-completer
```

The support for python would be done after this step, but the C-family is not configured yet (not for me).

**2. Semantic support for C family languages**

**Download latest version of ```libclang```**. The official guild suggest you download a binary library from [llvm.org](http://releases.llvm.org/download.html)，or you can download the source code and compile a customised library as I did (download the LLVM source code, llvm-5.0.0.src.tar.xz).

**Build LLVM**

```
cd your_path_for_LLvm
xz -d llvm-5.0.0.src.tar.xz
tar xvf llvm-5.0.0.src.tar
cd llvm-5.0.0.src
mkdir build
cd build
cmake ../
```
**Build ```ycm_core```**

Create a build folder ```ycm_build``` at the root directory of YouCompleteMe.

```
cd  ycm_build
cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH="/path_to_libclong.so/" . 
	~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/
(my libclang path is /YouCompleteMe/third_party/ycmd/libclang.so.5)

cmake --build . --target ycm_core
```

If you use the binary library or you wish to build additional language support, please follow the official guild.

**Set config file at vimrc**

add the following configure in  ```.vimrc```

```
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
```

The support for C-family language should work now !
***
### Multiple Cursor Installation
[Multiple Cursor](https://github.com/terryma/vim-multiple-cursors) is an awesome multiple selection plugin in vim, like it did in Sublime. The git demo can be found at the official pages.

The installation is also based on Vundle.

```git clone``` the project into ```~/.vim/bundle/```, add configure into ```.vimrc```.

```
Plugin 'terryma/vim-multiple-cursors'
```

Don't forget to run ```:PluginInstall``` in vim.