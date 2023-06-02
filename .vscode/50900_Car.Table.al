table 50900 Car
{
    DataClassification = CustomerContent;
    Caption = 'Car';

    fields
    {
        field(1;"No."; Integer)
        {
            DataClassification = CustomerContent;
            
        }

        field(2; Name; Text[30])
        {
            DataClassification = CustomerContent;
        }
        
        field(3; "Brand Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Brand.Code;
        }

        field(4; Gears; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Manual", "Automatic";
        }

        field(5; "Engine Power"; Integer)
        {
            DataClassification = CustomerContent;
            Description = 'The motor power will be stored in it.';
        }

        field(6; Electric; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'It will tell us if the car is electric or not.';
        }

        field(7; "Acquisition Date"; Date)
        {
            DataClassification = CustomerContent;
            Description = 'It will indicate the date of acquisition or age of the car.';
        }

        field(8; Plate; Code[10])
        {
            DataClassification = CustomerContent;
        }

    }
    
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

        key(Name; Name)
        {
            Unique = true;
            Description = 'Vehicle Name';
        }
    }
    
    // var
    //     myInt: Integer;
    
    trigger OnInsert()
    begin

        Message('Se ha creado un nuevo vehículo');
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}