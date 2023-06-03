// 转载请注明 http://www.freedelphitips.com

unit LauncherUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, CommCtrl, ShellAPI, ImgList, StdCtrls;

type
  Plistdata = ^Tlistdata;
  Tlistdata = record
    sName: string;
    desc: string;
  end;

type
  TLauncherForm = class(TForm)
    ListView1: TListView;
    image_icon: TImageList;
    ImageList1: TImageList;
    pnl_tip: TPanel;
    img_t_l: TImage;
    img_t_m: TImage;
    img_t_r: TImage;
    pnl_bot: TPanel;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    SpeedButton1: TSpeedButton;
    pnl_client: TPanel;
    img_c_l: TImage;
    img_c_r: TImage;
    pnl_line_l: TPanel;
    pnl_line_r: TPanel;

    procedure SpeedButton1Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);


    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListView1AdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);

  private
    procedure showdata();


  public
    { Public declarations }
  end;

var
  LauncherForm: TLauncherForm;
  listshortcut: tlist;
implementation



{$R *.dfm}

procedure TLauncherForm.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TLauncherForm.ListView1Click(Sender: TObject);
var
  s: string;
  ListData: Plistdata;
begin
  if ListView1.ItemIndex < 0 then exit;
  ListData := listshortcut.Items[ListView1.ItemIndex];
  s := ListData.desc; //得到对应数据的前地址
  ShowMessage(s);
end;

procedure TLauncherForm.showdata();
var
  ListData: Plistdata;
  i: integer;
begin
  ListView1.Items.Clear;
  listshortcut.Clear;
  //建演示数据
  for i := 0 to 15 do
  begin
    New(ListData);
    ListData.sName := '第' + inttostr(i) + '个名称';
    ListData.desc := '说明第' + inttostr(i) + '个名称';
    listshortcut.Add(ListData);
  end;

  for i := 0 to listshortcut.Count - 1 do //加空item
    ListView1.Items.add;
end;



procedure TLauncherForm.FormShow(Sender: TObject);
var
  hr: thandle;
begin
    //定义窗体园角
  hr := createroundrectrgn(0, 0, width + 1, height + 1, 5, 5); //定义园角矩形(win   API函数)
  setwindowrgn(handle, hr, true); //设置园角窗口
  showdata;
end;




procedure TLauncherForm.FormResize(Sender: TObject);
begin
  //showdata;
  Self.Repaint;
end;

procedure TLauncherForm.FormCreate(Sender: TObject);
var
  imgList: TImageList;
begin

  ListView1.DoubleBuffered := true; //启用双缓存，防止闪屏，但感觉没啥用
  ListView1.Tag := -1; //记住 上次mouse所在item的id  这个tag一般不用正好用来做全局变量
  listshortcut := tlist.Create;

   //----------------这里设置listView的LargeImages ,用imgList将其item放大
  imgList := timagelist.Create(nil);
  imgList.Width := 49;
  imglist.Height := 49;
  ListView1.LargeImages := imgList; //
  SendMessage(ListView1.Handle, LVM_SETICONSPACING, 0, MakeLong(70, 70)); //设定icon的间距

end;

procedure TLauncherForm.ListView1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
  li: TLIstItem;
  listindex: Integer;
  R: TRect; //R为文字覆盖的范围
  imglistviewbk: TBitmap; //RFill为文字填充的范围
  softicon: TBitmap;
  ListData: Plistdata;
begin
  p.X := x;
  p.Y := y;
  li := ListView1.GetItemAt(p.x, p.y);
  listindex := (Sender as TListView).Items.IndexOf(li);
  if listindex = -1 then Exit;
  if ListView1.Items.Count = 0 then exit;

  if ListView1.Tag = -1 then //第一次进入一个item 画当前item
  begin
    ListView1.Tag := listindex;

    R := ListView1.Items[listindex].DisplayRect(drBounds);
    ListData := listshortcut.Items[listindex];
    with ListView1.Canvas do
    begin
      imglistviewbk := TBitmap.Create;
      imglistviewbk.Width := ImageList1.Width;
      imglistviewbk.Height := ImageList1.Height;
      ImageList1.Draw(imglistviewbk.Canvas, 0, 0, 2, true);
      StretchDraw(r, imglistviewbk); //画背景图

    //画图标
      softicon := TBitmap.Create;
      softicon.Width := 32;
      softicon.Height := 32;
      image_icon.Draw(softicon.Canvas, 0, 0, listindex, true);
      Draw(r.Left + (r.Right - r.left - 32) div 2, r.top + 5, softicon);
      softicon.Free;
    //画软件名称
      r.top := r.top + 40;
      r.Bottom := r.Bottom - 5;
      r.left := r.left + 3;
      r.right := r.right - 3;
      SetBkMode(Handle, TRANSPARENT);
      DrawText(Handle,
        PChar(ListData.sname),
        Length(ListData.sname),
        r,
        DT_WORDBREAK or DT_CENTER);
    end;
    with ListView1.Canvas do
      if Assigned(Font.OnChange) then Font.OnChange(Font);
  end
  else if (ListView1.Tag <> -1) and (ListView1.Tag <> listindex) then
  //如果是已有上次mouse所在位置id,同时本次mouse所在id与上次不同，则先画本次mouse所在id,同时将上次id的item画成默认的
  begin
     //画当前item
    R := ListView1.Items[listindex].DisplayRect(drBounds);
    ListData := listshortcut.Items[listindex];
    with ListView1.Canvas do
    begin
      imglistviewbk := TBitmap.Create;
      imglistviewbk.Width := ImageList1.Width;
      imglistviewbk.Height := ImageList1.Height;
      ImageList1.Draw(imglistviewbk.Canvas, 0, 0, 2, true);
      StretchDraw(r, imglistviewbk); //画背景图

      //画图标
      softicon := TBitmap.Create;
      softicon.Width := 32;
      softicon.Height := 32;
      image_icon.Draw(softicon.Canvas, 0, 0, listindex, true);
      Draw(r.Left + (r.Right - r.left - 32) div 2, r.top + 5, softicon);
      softicon.Free;
    //画软件名称
      r.top := r.top + 40;
      r.Bottom := r.Bottom - 5;
      r.left := r.left + 3;
      r.right := r.right - 3;
      SetBkMode(Handle, TRANSPARENT);
      DrawText(Handle,
        PChar(ListData.sname),
        Length(ListData.sname),
        r,
        DT_WORDBREAK or DT_CENTER);
    end;
    //恢复上一个的颜色
    R := ListView1.Items[ListView1.tag].DisplayRect(drBounds);
    ListData := listshortcut.Items[ListView1.tag];
    with ListView1.Canvas do
    begin
      Brush.Color := clWhite;
      FillRect(r); //填充颜色

      //画图标
      softicon := TBitmap.Create;
      softicon.Width := 32;
      softicon.Height := 32;
      image_icon.Draw(softicon.Canvas, 0, 0, ListView1.tag, true);
      Draw(r.Left + (r.Right - r.left - 32) div 2, r.top + 5, softicon);
      softicon.Free;
    //画软件名称
      r.top := r.top + 40;
      r.Bottom := r.Bottom - 5;
      r.left := r.left + 3;
      r.right := r.right - 3;
      SetBkMode(Handle, TRANSPARENT);
      DrawText(Handle,
        PChar(ListData.sname),
        Length(ListData.sname),
        r,
        DT_WORDBREAK or DT_CENTER);
    end;
    with ListView1.Canvas do
      if Assigned(Font.OnChange) then Font.OnChange(Font);
    ListView1.Tag := listindex;
  end;

end;


procedure TLauncherForm.ListView1AdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  R: TRect; //R为文字覆盖的范围
  imglistviewbk: TBitmap; //背景
  softicon: TBitmap; //图标
  ListData: Plistdata;
begin
  R := Item.DisplayRect(drBounds);
  ListData := listshortcut.Items[Item.index];
  with ListView1.Canvas do
  begin
    if cdsSelected in State then
    begin
      imglistviewbk := TBitmap.Create;
      imglistviewbk.Width := ImageList1.Width;
      imglistviewbk.Height := ImageList1.Height;
      ImageList1.Draw(imglistviewbk.Canvas, 0, 0, 0, true);
      StretchDraw(r, imglistviewbk); //画背景图
      imglistviewbk.Free;
    end;

    //画图标
    softicon := TBitmap.Create;
    softicon.Width := 32;
    softicon.Height := 32;

    image_icon.Draw(softicon.Canvas, 0, 0, Item.index, true);
    Draw(r.Left + (r.Right - r.left - 32) div 2, r.top + 5, softicon);
    softicon.Free;

  ////  画软件名称
    r.top := r.top + 40;
    r.Bottom := r.Bottom - 5;
    r.left := r.left + 3;
    r.right := r.right - 3;
    SetBkMode(Handle, TRANSPARENT); //设定文字为透明
    DrawText(Handle,
      PChar(ListData.sname),
      Length(ListData.sname),
      r,
      DT_WORDBREAK or DT_CENTER);
  end;
  with Sender.Canvas do
    if Assigned(Font.OnChange) then Font.OnChange(Font);
end;



end.

