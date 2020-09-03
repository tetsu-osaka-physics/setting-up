# setting-up
物理科で教材を作成する為に必要なmacの環境構築です．

## Homebrewの導入
ターミナル：
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
**注意** ターミナルで`Password: `と言う風にパスワードを求められることがあります．
Macに設定しているパスワードを入力してください（自分が打った文字は出てこない）．
次にHomebrew caskをインストールします．ターミナル：
```sh
brew tap caskroom/cask
```

## データの取得
ネットに上げてるデータを取得します．ターミナルで以下の文章を打ってください：
```sh
brew install git
git clone https://github.com/tetsu-osaka-physics/setting-up.git ~/FOR
```
必要なデータが`~/FOR`に入ります．

## ghostscriptの導入
ターミナル：
```sh
brew install ghostscript
```

## mactex導入
ターミナル：
```sh
brew cask install mactex
```

## Atomの導入
先程のステップでTeXディストリビューションのインストールが終わり，標準のエディタとしてTeX Shopが入っていると思います．
個人的にがAtomが好きなので，Atomの設定をします．
ターミナル：
```sh
brew cask install atom
apm install language-latex latexer latextools latex pdf-view
```
Atomを開いて，`command+,`で設定に行く．Packagesを開いてlatexパッケージを開きます．
そのSettingsで次のように設定します．
- Tex Path: `/usr/local/texlive/2020/bin/x86_64-darwin`
- Engine: `platex`
- Opner: `pdf-view`

**もしtexlive202Xが出たら，texlive/202X/で設定！**

## dvipdfmxのフォント埋め込み設定
ターミナル：
```sh
sudo tlmgr update --self --all
sudo tlmgr repository add http://contrib.texlive.info/current tlcontrib
sudo tlmgr pinning add tlcontrib '*'
sudo tlmgr install japanese-otf-nonfree japanese-otf-uptex-nonfree ptex-fontmaps-macos cjk-gs-integrate-macos
sudo cjk-gs-integrate --link-texmf --cleanup
sudo cjk-gs-integrate-macos --link-texmf
sudo mktexlsr
sudo kanji-config-updmap-sys --jis2004 hiragino-highsierra-pron
```
古いコマンド（pretesの時用）：
```sh
sudo cp -r ~/FOR/texmf-local/fonts/map /usr/local/texlive/texmf-local/fonts
sudo cp -R ~/FOR/texmf-local/fonts/opentype /usr/local/texlive/texmf-local/fonts/opentype
sudo mktexlsr
sudo kanji-config-updmap-sys hiragino-highsierra
sudo mktexlsr
```

## latexmkの設定
ターミナル：
```sh
cp ~/FOR/latexmkrc ~/.latexmkrc
```

## inkscapeの導入
ターミナル：
```sh
brew cask install inkscape
```
図の細かい話は[wiki](https://github.com/tetsu-osaka-physics/tetsu_physic/wiki/figure)参照．

## 不要ファイルの削除
ターミナル：
```sh
cp ~/FOR/autodelete.sh ~/Desktop/autodelete.sh
cd ~/Desktop
chmod a+x autodelete.sh
```
TeXでコンパイルすると，不要な中間ファイル（`.aux`など）が生成されます．
デスクトップにできた`autodelete.sh`を開けば勝手に削除してくれます．

**ターミナルで使いたい人向け**
ターミナル：
```sh
cp ~/for/autodelete.sh /usr/local/bin/autodelete.sh
chmod a+x /usr/local/bin/autodelete.sh
```
あとは，ターミナル上で`autodelete`と打てば実行される．例：
```sh
cd GoogleDrive/tetsu/h2p
autodelete
```
この場合，`GoogleDrive/tetsu/h2p`以下のディレクトリだけを検索・削除対象にするので早く終わる．

## 鉄TeXの導入（任意）
ここまでで，普段の復習テストから校内模試の問題と解答まで全て作ることができますが，講評に関しては，鉄TeXで作る必要があります．
ただ，鉄TeXは年に２度しか使わないし，共用のMacでも使えるから，わざわざ入れる必要はない．
サーバーにつないだ状態で，
```sh
cp /Volumes/1_ユーザ_Osaka/00_共通/98_鉄TeX/TeXインストール用ファイル/TetsuTeX.dmg ~/Desktop/
```
でデスクトップに入った`TetsuTeX.dmg`を開く．
この時，右クリック（２本指でタップ）して 「開く」を選択しないと開けないかも．
<!-- ターミナル：
```sh
echo export PATH=\$PATH:/usr/local/tetex/bin >> ~/.bash_profile
```
（zshの人は`.bash_profile`じゃなくて`.zshrc`） -->
<!-- ```sh
atom ~/.bash_profile
```
でatomを開いて，
```
export PATH="/usr/local/tetex/bin:$PATH"
```
を追加します（この時，`export PATH="/usr/local/texlive/2019/bin/x86_64-darwin:$PATH"`よりも上の行に書くこと！）． -->
<!-- **以下の手順は，エラーが出たら行ってください！**
次に，鉄TeXのエラーを解決します．変数のパスがアレなのと，鉄TeXで`余白とヘッダ.sty`と`機密ラベル.sty`が見つからないと言われる．ターミナル：
```sh
mv ~/FOR/styhelp.sh ~/Desktop/styhelp.sh
cd ~/Desktop
chmod a+x styhelp.sh
```
これで`styhelp.sh`がデスクトップに保存されるので，あとは実行するだけ（アップデートした後もこれを実行する）． -->
<!-- ヒラギノフォントの埋め込みは，
```sh
cp -R ~/FOR/texmf-local/fonts/opentype/hiragino /usr/local/tetex/share/texmf/fonts/opentype
/usr/local/tetex/bin/mktexlsr
/usr/local/tetex/bin/updmap-sys
/usr/local/tetex/bin/mktexlsr
``` -->
次に，鉄TeXをアップデートしましょう．
`command+K`で`afp://192.168.20.5`に繋いで，ユーザーのマウントに入った後に，鉄TeXアップローダーをクリックすればできます．
<!-- アップデートしたらstyが見つからないエラーが多分起こるので，デスクトップの`styhelp.sh`を実行すれば良い． -->
<!-- アップデートすればフォントやstyのエラーは発生しない(2020/9/3)． -->

鉄TeXを使う時はAtomのlatexパッケージで
- Path: `/usr/local/tetex/bin`
- Engine: `uplatex`
に設定．

ターミナルからやるなら，
```sh
/usr/local/tetex/bin/uplatex hoge.tex
```
でコンパイルして
```sh
/usr/local/tetex/bin/dvipdfmx hoge.dvi
```
でpdfにできる．

## 特殊styの設定
鉄緑独自のアレな教材を作るための設定をする．
[これ](https://github.com/tetsu-osaka-physics/tetsu_physic/blob/master/README.md/#初回導入時の設定)参照．

## トラブルシューティング
### Atom
#### コンパイル
Atomでコンパイル(`ctrl+alt+b`)しようとするとlatexでのコンパイルになりエラーが出る，もしくは勝手にソースファイルのレイアウトが変わる．

　&rarr;texを編集している状態のAtomで`command+.`でkey bind resolverを開き，`ctrl+alt+b`と打つ．
この時に，最上位にlatexが来ていなければkey bindが原因．`command+,`で設定＞Keybindings＞your keymap file（上の方の大文字）で`keymap.cson`を開き，最後に
```CSON
'atom-text-editor[data-grammar~="latex"]':'ctrl-alt-b': 'latex:build'
```
を付け加える．

#### `\]`が勝手に出てくる
設定(`command+,`)を開き，Packages&rarr;latexerを選択して，Autocomplete environmentsを外す．

### 鉄TeXのエラー
#### TestuTeXアップデーターが使えない
&rarr;サーバーに繋いだ状態で，
```sh
sudo /Volumes/1_ユーザ_Osaka/00_共通/98_鉄TeX/TeXインストール用ファイル/鉄TeXアップデート.command
```
と入力する．

#### 鉄TeXがアップデートを強要してくる
&rarr;アップデートしましょう．若しくは
```sh
sed -i '' -e's/@warning@leveltwo{90}/@warning@leveltwo{10000}/g' /usr/local/tetex/share/texmf/ptex/platex/tetsutex/tetsuryoku.sty
```
（各方面から怒られそう）

### Homebrewの不具合
&rarr;Homebrewが壊れた！
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
```
でアンインストール．

# Windows編
## dvipdfmxのフォント埋め込み設定
### bizud
```batchfile
kanji-config-updmap-sys bizud
```
`\KAlpha`，`\KRoman`，`\Kroman`，`\KHira*`，`\KKata*`，`\KKiroha*`，`\KHiroha*`が括弧つかない．

### haranoaji
```batchfile
kanji-config-updmap-sys haranoaji
```
`\KRoman`，`\Kroman`，`\KHira*`，`\KKata*`，`\KKiroha*`，`\KHiroha*`が文字化け．

<!-- ### hiragino
ヒラギノはWindowsには入ってないので購入の必要あり．コマンドプロンプト（管理者）：
```batchfile
updmap-sys --setoption kanjiEmbed hiragino-pron
mkdir C:\texlive\texmf-local\fonts\opentype\hiragino
mklink C:\texlive\texmf-local\fonts\opentype\hiragino\HiraMinPro-W3.otf C:\Windows\Fonts\ヒラギノ明朝 Pro W3.otf
mklink C:\texlive\texmf-local\fonts\opentype\hiragino\HiraMinPro-W6.otf C:\Windows\Fonts\ヒラギノ明朝 Pro W6.otf
mklink C:\texlive\texmf-local\fonts\opentype\hiragino\HiraKakuPro-W3.otf C:\Windows\Fonts\ヒラギノ角ゴ Pro W3.otf
mklink C:\texlive\texmf-local\fonts\opentype\hiragino\HiraKakuPro-W6.otf C:\Windows\Fonts\ヒラギノ角ゴ Pro W6.otf
``` -->

<!-- ### hiragino-pron
ヒラギノはWindowsには入ってないので購入の必要あり．コマンドプロンプト（管理者）：
```batchfile
updmap-sys --setoption kanjiEmbed hiragino-pron
mkdir C:\texlive\texmf-local\fonts\opentype\hiragino
mklink C:\texlive\texmf-local\fonts\opentype\hiragino\HiraMinProN-W3.otf C:\Windows\Fonts\ヒラギノ明朝 ProN W3.otf
mklink C:\texlive\texmf-local\fonts\opentype\hiragino\HiraMinProN-W6.otf C:\Windows\Fonts\ヒラギノ明朝 ProN W6.otf
mklink C:\texlive\texmf-local\fonts\opentype\hiragino\HiraKakuProN-W3.otf C:\Windows\Fonts\ヒラギノ角ゴ ProN W3.otf
mklink C:\texlive\texmf-local\fonts\opentype\hiragino\HiraKakuProN-W6.otf C:\Windows\Fonts\ヒラギノ角ゴ ProN W6.otf
``` -->

### ipa
```batchfile
kanji-config-updmap-sys ipa
```
使い物にならない．

### ipaex
```batchfile
kanji-config-updmap-sys ms
```
使い物にならない．

### kozuka-pr6n（推奨）
1. Adobe Acrobat Readerをダウンロード．

2. `C:\Program Files (x86)\Adobe\Acrobat Reader DC\Resource\CIDFont`にある`KozGoPr6N-Medium.otf`と`KozMinPr6N-Regular.otf`を管理者権限で全ユーザーにインストール．

3. コマンドプロンプト（管理者）：
  ```batchfile
  updmap-sys --setoption kanjiEmbed kozuka-pr6n
  mkdir C:\texlive\texmf-local\fonts\opentype\kozuka
  mklink C:\texlive\texmf-local\fonts\opentype\kozuka\KozMinPr6N-Regular.otf C:\Windows\Fonts\KozMinPr6N-Regular.otf
  mklink C:\texlive\texmf-local\fonts\opentype\kozuka\KozGoPr6N-Regular.otf C:\Windows\Fonts\KozGoPr6N-Medium.otf
  mklink C:\texlive\texmf-local\fonts\opentype\kozuka\KozMinPr6N-Bold.otf C:\Windows\Fonts\KozGoPr6N-Medium.otf
  mklink C:\texlive\texmf-local\fonts\opentype\kozuka\KozGoPr6N-Bold.otf C:\Windows\Fonts\KozGoPr6N-Medium.otf
  ```
`\textgt`と`\textbf`の区別がなくなるが，文字化けは無い．

### ms
コマンドプロンプト：
```batchfile
kanji-config-updmap-sys ms
```
`\KAlpha`，`\KRoman`，`\Kroman`，`\KHira*`，`\KKata*`，`\KKiroha*`，`\KHiroha*`が括弧つかない．

### noEmbed（非推奨）
```batchfile
kanji-config-updmap-sys noEmbed
```

### yu-win10
```batchfile
updmap-sys --setoption kanjiEmbed yu-win10
```
`\KAlpha`，`\KRoman`，`\Kroman`，`\KHira*`，`\KKata*`，`\KKiroha*`，`\KHiroha*`が括弧つかない．
