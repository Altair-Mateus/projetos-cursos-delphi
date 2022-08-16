unit UnitContatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    EditId: TEdit;
    LabelId: TLabel;
    LabelNome: TLabel;
    EditNome: TEdit;
    LabelTelefone: TLabel;
    EditTelefone: TEdit;
    LabelEmail: TLabel;
    EditEmail: TEdit;
    LabelObservacoes: TLabel;
    MemoObservacoes: TMemo;
    FDConnection1: TFDConnection;
    FDTable_Contatos: TFDTable;
    DataSource1: TDataSource;
    Button_Novo: TButton;
    Button_Salvar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
