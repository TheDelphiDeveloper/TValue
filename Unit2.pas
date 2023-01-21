unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Rtti;

type
  TPerson = class
  private
   FFirstName : string;
   FLastName : string;
   FAge : Byte;
   FSalary : Double;
  published
   property FirstName: string read FFirstName write FFirstName;
   property LastName: string read FLastName write FLastName;
   property Age: Byte read FAge write FAge;
   property Salary: double read FSalary write FSalary;
  end;

  TPersonArray = array of TPerson;


  TPoint = class
  private
   FX:Integer;
   FY:Integer;
  published
   property X: Integer read FX write FX;
   property Y: Integer read FY write FY;
  end;

  TPointArray = array of TPoint;


  TForm2 = class(TForm)
    BotaoTPerson: TButton;
    memoDoTPerson: TMemo;
    memoDoTPoint: TMemo;
    BotaoTPoint: TButton;
    procedure BotaoTPersonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BotaoTPointClick(Sender: TObject);
  private
    vPersonValue  : TValue;
    vPointValue   : TValue;

    procedure TodosSaoBemVindos(const AValue: TValue; AMemo: TMemo);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BotaoTPersonClick(Sender: TObject);
begin
 TodosSaoBemVindos(vPersonValue, memoDoTPerson);

end;
procedure TForm2.BotaoTPointClick(Sender: TObject);
begin
    TodosSaoBemVindos(vPointValue, memoDoTPoint);
end;


procedure TForm2.TodosSaoBemVindos(const AValue: TValue; AMemo : TMemo);
Var
 Ind        : Integer;
 xRttiType  : TRttiType;
 xRttiField : TRttiField;
begin
 for Ind := 0 to Pred(AValue.GetArrayLength) do
 begin
   xRttiType := TRttiContext
                  .Create
                  .GetType(
                    AValue
                    .GetArrayElement(Ind).
                    TypeInfo);


   for xRttiField in xRttiType.GetFields do
   begin
     AMemo.Lines.Add(
        Format('Index = %d FieldName=%s Value=%s',
                [
                  Ind,
                  xRttiField.Name,
                  xRttiField.GetValue(AValue
                    .GetArrayElement(Ind)
                    .AsObject)
                    .AsVariant
                ]
              )
     );
   end;
 end;
end;



procedure TForm2.FormShow(Sender: TObject);
Var
 lPersonArray : TPersonArray;
 lPointArray  : TPointArray;
begin
 //popular Person
 SetLength(lPersonArray,1);
 lPersonArray[0]            := TPerson.Create;
 lPersonArray[0].FFirstName := 'S';
 lPersonArray[0].FLastName  := 'B';
 lPersonArray[0].FAge       := 25;
 lPersonArray[0].FSalary    := 5000;

 vPersonValue := TValue.From<TPersonArray>(lPersonArray);

 //Popular Point
 SetLength(lPointArray,1);
 lPointArray[0]   := TPoint.Create;
 lPointArray[0].X := 50;
 lPointArray[0].Y := 60;

 vPointValue := TValue.From<TPointArray>(lPointArray);
end;





end.
