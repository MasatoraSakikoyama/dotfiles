# dotfiles

macOS (Apple Silicon) 向けの zsh / Neovim / tmux 初期設定です。

## Setup

```bash
./bootstrap
```

`bootstrap` は Homebrew の導入、必要パッケージのインストールと更新、ホームディレクトリへのシンボリックリンク作成、Neovim のプラグイン同期まで行います。`git` と `zsh` は Homebrew 版を使う前提で、ログインシェルも Homebrew 版 `zsh` に切り替えます。Git 設定は `~/.config/git/config` にテンプレートをコピーし、`~/.gitconfig` は触りません。既存の同名ファイルやディレクトリがある場合は置き換えず、エラーで終了します。確認だけしたい場合は `./bootstrap --dry-run` を使えます。

## Uninstall

```bash
./uninstall
```

`uninstall` は bootstrap で管理しているシンボリックリンクを外し、`git` / `neovim` / `tmux` / `zsh` を Homebrew からまとめて削除します。`~/.config/git/config` にコピーした Git 設定は削除しません。Homebrew 自体も消す場合は `./uninstall --remove-homebrew` を使います。確認だけしたい場合は `./uninstall --dry-run` を使えます。

## Layout

- `~/.zshrc` は薄いエントリポイントで、実体は `~/.config/zsh/.zshrc`
- Neovim は `~/.config/nvim/init.lua`
- tmux は `~/.config/tmux/tmux.conf`
- git は `~/.config/git/config` にテンプレートをコピーして使う
