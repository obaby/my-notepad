unit unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DynamicSkinForm, SkinData, StdCtrls, SkinExCtrls, SkinCtrls,
  pngimage, ExtCtrls;

type
  TAboutBox = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinData1: TspSkinData;
    img1: TImage;
    spSkinShadowLabel2: TspSkinShadowLabel;
    spSkinLinkLabel1: TspSkinLinkLabel;
    spSkinShadowLabel3: TspSkinShadowLabel;
    spSkinShadowLabel4: TspSkinShadowLabel;
    spSkinLinkLabel2: TspSkinLinkLabel;
    spSkinShadowLabel5: TspSkinShadowLabel;
    spSkinShadowLabel7: TspSkinShadowLabel;
    spSkinShadowLabel6: TspSkinShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation
  uses Unit1;

{$R *.dfm}

end.
