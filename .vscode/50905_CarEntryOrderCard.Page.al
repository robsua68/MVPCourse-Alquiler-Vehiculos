page 50905 "Car Entry Order Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Car Entry Order";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                                
                field("No.";Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the key number of the document.';
                }

                field("Car No.";Rec."Car No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the field that will reference the vehicle.';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin

                        GetCarName();

                    end;
                }

                field(CarName;CarName)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the Car name.';
                }

                field("Customer no.";Rec."Customer no.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Customer Number.';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin

                        GetCustomerName();

                    end;

                }

                field(CustomerName;CustomerName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Customer Name.';
                    Editable = false;
                }

                field("Posting date";Rec."Posting date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document date.';

                }
                field(Status;Rec.Status)
                {
                    Caption = 'Document Status';
                    ApplicationArea = All;
                    ToolTip = 'Specifies Status ''Open'' whether the document admits further modifications, otherwise set the document to ''Closed''';

                    trigger OnValidate()

                    begin

                       CurrPage.Editable := Rec.Status = REc.Status::Open;

                    end;

                }

                field(Description;Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the vehicle devolution.';

                }

            }

            group("Rent Information")
            {

                field("Rent date";Rec."Rent date")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the vehicle rental.';

                    trigger OnValidate()
                    begin

                        if Rec."Rent date" < Rec."Posting date" then
                                Error('Rent date should be greater or equal to the Posting date.');

                    end;

                }

                field("Rent Description";Rec."Rent Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'It is a brief description of the rental service.';
                }

            }

            group("Devolution Information")
            {

                field("Devolution date";Rec."Devolution date")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the vehicle devolution.';

                    trigger OnValidate()
                    begin

                        if Rec."Devolution date" < Rec."Rent date" then
                                Error('Devolution date should be greater or equal to the Rent date.');

                    end;

                }

                field("Devolution description";Rec."Devolution description")
                {
                    ApplicationArea = All;
                    ToolTip = 'This field contains a small description related to the vehicle devolution.';

                    trigger OnValidate()
                    begin
                        
                        if Rec."Devolution date" = 0D then 
                            Error('Devolution date should be entered before the devolution description.');

                    end;

                }

            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(CarRent)
            {
                ApplicationArea = All;
                Caption = 'Car Rent';
                Image = GetOrder;
                
                trigger OnAction();
                var
                    CarManagementCodeunit: Codeunit "Car Management";

                begin

                    if Rec."Rent date" = 0D then
                        Error('Please fill out the fields related to ''Rent Information''');
                 
                    CarManagementCodeunit.CarPostRent(Rec);
                    
                end;
            }

            action(CarDevolution)
            {
                ApplicationArea = All;
                Caption = 'Car Devolution';
                Image = ReturnOrder;
                
                trigger OnAction();
                var
                    CarManagementCodeunit: Codeunit "Car Management";

                begin

                    if Rec."Devolution date" = 0D then
                        Error('Please fill out the fields related to ''Devolution Information''');

                    CarManagementCodeunit.CarPostDevolution(Rec);                  
                
                end;
            }
        }
    }
    
    var
        CustomerName: Text[100];
        CarName: Text[30];

    trigger OnAfterGetCurrRecord()
    begin

        if Rec."Posting date" = 0D then 
                Rec."Posting date" := Today; 

    end;

    local procedure GetCustomerName()
    var
        CustomerRecord: Record Customer;

    begin

        // Initializing the variables
        CustomerName := '';
        CustomerRecord.Init();

        if CustomerRecord.Get(Rec."Customer no.") then 
            CustomerName := CustomerRecord.Name;

    end;

    local procedure GetCarName()
    var
        CarRecord: Record Car;

    begin

        // Initializing the variables
        CarName := '';
        CarRecord.Init();

        if CarRecord.Get(Rec."Car No.") then 
            CarName := CarRecord.Name;

    end;

}