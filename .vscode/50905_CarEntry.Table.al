// "Car Entry" is where all the movements of the vehicles will be recorded, 
// and it will help us to consult the history of movements that a vehicle has had.

table 50905 "Car Entry"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Description = 'It is the key of the document';
        }
        field(2; "Car no."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Car."No.";
            Description = 'It is the field that will reference the vehicle';
        }
        field(3; "Posting date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'This field will record the date of the document.';
        }
        field(4; "Entry type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Rent", "Devolution", "Technical check";
            Description = 'Options type';
        }
        field(5; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'This field is for a small description related to the document.';
        }
        field(6; "Customer no."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            Description = 'This field contains reference to the customer to whom the vehicle is rented.';
        }
    }
    
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(key2; "Car no.")
        {

        }
    }
    
    var
        myInt: Integer;
    
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