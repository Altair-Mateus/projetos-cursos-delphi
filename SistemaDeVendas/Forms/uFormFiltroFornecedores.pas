unit uFormFiltroFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormFiltroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls,
  uFormCadastroFornecedor, Vcl.Grids, Vcl.DBGrids;

type
  TFormFiltroPai1 = class(TFormFiltroPai)
    LabelFantasia: TLabel;
    EditFantasia: TEdit;
    EditCnpj: TEdit;
    LabelCnpj: TLabel;
    EditCodigo: TEdit;
    LabelCodigo: TLabel;
    DBGrid1: TDBGrid;
    procedure ButtonNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFiltroPai1: TFormFiltroPai1;

implementation

{$R *.dfm}

procedure TFormFiltroPai1.ButtonNovoClick(Sender: TObject);
begin
  inherited;

  //  Cria o form
  FormCadastroFornecedor := TFormCadastroFornecedor.Create(Self);

  try

    //  Exibe o Form
    FormCadastroFornecedor.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(FormCadastroFornecedor);

  end;

end;

end.
