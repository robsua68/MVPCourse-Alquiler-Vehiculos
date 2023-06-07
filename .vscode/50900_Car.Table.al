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

            trigger OnValidate()
            var
                ExtendedName: Text[40];

            begin

                 ExtendedName := Name + ' - '  + "Brand Code";

                "Extended Name" := ExtendedName;

                CheckBrand();

            end;
        }
        
        field(3; "Brand Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Brand.Code;

            trigger OnValidate()
            var
                ExtendedName: Text[40];

            begin

                ExtendedName := Name + ' - '  + "Brand Code";

                "Extended Name" := ExtendedName;

                CheckBrand();

            end;
        }

        field(4; Gears; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Manual", "Automatic";

            trigger OnValidate()
            begin

                CheckBrand();

            end;
        }

        field(5; "Engine Power"; Integer)
        {
            DataClassification = CustomerContent;
            Description = 'The motor power will be stored in it.';

            trigger OnValidate()
            begin

                CheckBrand();

            end;
        }

        field(6; Electric; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'It will tell us if the car is electric or not.';

            trigger OnValidate()
            begin

                CheckBrand();

            end;
        }

        field(7; "Acquisition Date"; Date)
        {
            DataClassification = CustomerContent;
            Description = 'It will indicate the date of acquisition or age of the car.';
            
            trigger OnValidate()
            begin

                CheckBrand();

            end;
        }

        field(8; Plate; Code[10])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin

                CheckBrand();

            end;

        }

        field(9; "Extended Name"; Text[40])
        {
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin

                CheckBrand();

            end;

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

    local procedure CheckBrand()
    begin

        if StrLen(Rec."Brand Code") = 0 then 
                Error('The brand must be filled');
        
    end;
    
}