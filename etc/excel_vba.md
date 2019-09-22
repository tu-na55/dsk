```py
# すべてカウント
counta(exist_cell)+countblank(null_cell)
count(int_cell)
countif(cell,"*hoge")



'#######################################################################
dim ws as variant
dim i as integer

set ws = thisWorkbook.worksheets(1)
# 最終行取得
eor = ws.cells(row, col).end(xlDown).row

if cells(rows.count, 1).end(xlup).row = 1 then

if cells(rows.count, 1).end(xlup).select

Sub list()
  Dim c As Integer
  c = 3
  Dim list() As Integer
  ReDim list(c)
  list(0) = 0
  list(1) = 100
  list(2) = 200
  ReDim Preserve list(c + 1)
  list(3) = 300
End Sub


Sub list()
  Dim list(2) As Range
  Set list(0) = Cells(1, 1)
  Set list(1) = Cells(1, 2)
  Set list(2) = Cells(1, 3)
  Dim size as Integer
  ' length
  size = UBound(list) - LBound(list) + 1
End Sub

'#######################################################################

# ' ボタン作成
private sub button_on_click()
  call func
end sub

Sub showMessage(Optional num As Integer = 1)
  MsgBox "ボタン" & num & "が押されました"
End Sub
'#######################################################################
' 変更を引数にする

Private Sub Worksheet_SelectionChange(ByVal Target As Range)
    Cells.Font.ColorIndex = xlAutomatic
    Target.Font.ColorIndex = 3
End Sub

Private Sub Worksheet_Change(ByVal Target As Range)
    If Intersect(Target, Range("A1:B5")) Is Nothing Then
        Exit Sub
    Else
        MsgBox "セルの値が変更されました"
    End If
End Sub
'#######################################################################

With Application
    .ScreenUpdating = False
    .EnableEvents = False
    .Calculation = xlCalculationManual
End With

With Application
    .ScreenUpdating = True
    .EnableEvents = True
    .Calculation = xlCalculationAutomatic
End With
'#######################################################################
cells(row, col).interior.ColorIndex=48

Range("A1").EntireRow.Hidden = True

sub hide()
  if range("cell") = "" then
    rows(11).hidden
  end if
end sub


Sub filter()
    Selection.AutoFilter
    ActiveSheet.Range("$A$1:$B$9").AutoFilter
      ' col
      Field:=1,
      Criteria1:="val"
End Sub


# 見えているものだけカウント
...enc(xlup).specialCells(xlCellTypeVisible).count

'#######################################################################
sub delete_object()
  ActiveSheet.Shapes.SelectAll
  selection.delete
end sub

'#######################################################################
' グラフのX軸(横軸)のタイトルを設定
ActiveChart.Axes(xlCategory, xlPrimary).HasTitle = True
ActiveChart.Axes(xlCategory, xlPrimary).AxisTitle.Characters.Text = "X軸タイトル"

Sub graph()
  ActiveSheet.ChartObjects("グラフ 1").Activate

  With ActiveChart.Axes(xlValue)
      .MinimumScaleIsAuto = True ' 最小値は自動
      .MaximumScale = 500        ' 最大値は500
      .MinorUnitIsAuto = True    ' 補助目盛間隔は自動
      .MajorUnit = 10            ' 目盛間隔は10
      .Crosses = xlAutomatic     ' X軸との交点は自動
      .ReversePlotOrder = False  ' 軸の反転はしない
      .ScaleType = xlLinear      ' 対数目盛を表示する場合は xlLogarithmic
      .DisplayUnit = xlNone      ' 表示単位は設定なし
  End With

End Sub

'#######################################################################


```
___
.vbs
VBAと同じようにプロシージャの集まりとして作っておいてCallするという方法をとれば、VBAプログラムとの高い互換性を保ちつつスクリプト化できるのでおすすめ。

```py
Option VBASupport 1

REM  *****  BASIC  *****

Sub Main
  Range("A1") = "Test"

End Sub
```

```py
sub Main3
   Range("A1") = TestFnc(10)
end sub

Function TestFnc(a)
   TestFnc = a*10
End Function
```


___
```py
'下で定義するDebugPrintクラスをもとに変数Debugを準備
Dim Debug: Set Debug = New DebugPrint

Call Main

Sub Main()
    Debug.Print "こんにちは"
    Debug.Print "さようなら"
    Debug.Flush 'FlushしてはじめてPrintした内容がMsgBoxで表示される。
End Sub

'以下にDebugPrintクラスを定義
Class DebugPrint
    Private message

    Public Sub Print(msg)
        message = message & msg & vbNewLine
    End Sub

    Public Sub Flush()
        MsgBox message
        Call Clear
    End Sub

    Public Sub Clear()
        message = ""
    End Sub
End Class
```

こうするとVBAからの移植性はアップする。
メインコードをわざわざ書き直さなくても、Flushを呼ぶという変更だけで済む。
___
### VBAからVBScriptへマクロを移植する方法
マクロをそのまま貼り付ける。
変数宣言から型の宣言を取り除く(あるいはコメントアウト)。
エントリーポイントから実行したいマクロをCallする。
参照設定からCreateObject形式に切り替える。
上記で大体動くが、Debug.Printを使っていたり、Select文の高度な機能(Is比較、n To n表記など)を利用している場合は修正が必要になる。
___
### VBScriptからVBAへマクロを移植する方法
上位互換とは言わないが、基本的に、Sub～End Subでくくってやれば大体のスクリプトはそのまま動く。
VBAも型宣言なしで動作するし、CreateObjectにも対応しているのでVBSからVBAへは極めて移植性が高い。
ただしWScript.Echoを使っている場合はMsgBoxかDebug.Printへ変更が必要である。

長いスクリプトをそのまま貼り付けると、長いプロシージャが出来上がるのであまり良くない。
VBScriptにおいても最初からプロシージャにコードを書くようにし、適切にプロシージャを分割しておくとVBAに移植してもスッキリと見通しの良いコードになる。
___







