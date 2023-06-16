page 50904 "Car Entry Order List"
{
    Caption = 'Car Entry Order List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Car Entry Order";
    Editable = false;
    CardPageId = "Car Entry Order Card";
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No.";Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Car No.";Rec."Car No.")
                {
                    ApplicationArea = All;
                }
                field(CarName;CarName)
                {
                    ApplicationArea = All;
                }
                field("Customer no.";Rec."Customer no.")
                {
                    ApplicationArea = All;

                }
                field(CustomerName;CustomerName)
                {
                    ApplicationArea = All;
                }
                field("Posting date";Rec."Posting date")
                {
                    ApplicationArea = All;
                }
                field("Rent date";Rec."Rent date")
                {
                    ApplicationArea = All;
                }
                field("Devolution date";Rec."Devolution date")
                {
                    ApplicationArea = All;
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea = All;
                }
                
            }
        }
        area(Factboxes)
        {
            
        }
    }
    
    actions
    {
        // Add actions
    }

    var
        CustomerName: Text[100];
        CarName: Text[30];

    trigger OnAfterGetRecord()
    begin

        GetCustomerName();

        GetCarName();

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