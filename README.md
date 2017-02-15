# dotfiles
## swift syntax highlight
- cd ~/.vim/bundle/
- git clone git@github.com:apple/swift.git apple-swift
- cd apple-swift
- git filter-branch --subdirectory-filter utils/vim HEAD
