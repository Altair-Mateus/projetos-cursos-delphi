unit Unit1_Contatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Bind.Components, Data.Bind.DBScope,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TForm_contatos = class(TForm)
    FDConnection1: TFDConnection;
    BindSourceCONTATOS: TBindSourceDB;
    FDTableCONTATOS: TFDTable;
    LabelId: TLabel;
    LabelNome: TLabel;
    LabelTelefone: TLabel;
    LabelEmail: TLabel;
    EditId: TEdit;
    EditNome: TEdit;
    EditTelefone: TEdit;
    EditEmail: TEdit;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    LabelRegistros: TLabel;
    MemoObservacoes: TMemo;
    LabelObservacoes: TLabel;
    LinkControlToField5: TLinkControlToField;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_contatos: TForm_contatos;

implementation

{$R *.dfm}

procedure TForm_contatos.Button1Click(Sender: TObject);
begin
  Form_contatos.Close;
end;

procedure TForm_contatos.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin

end;

end.