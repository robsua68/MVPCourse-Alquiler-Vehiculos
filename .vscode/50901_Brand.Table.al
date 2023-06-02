table 50901 Brand
{
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Cars Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count (Car where ("Brand Code"=field(Code)));
        }
    }
    
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
    
    // var
    //     myInt: Integer;
    
    trigger OnInsert()
    begin
        
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