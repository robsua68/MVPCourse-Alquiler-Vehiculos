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