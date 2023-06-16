// This table will house the documents we use to generate vehicle movements (rentals and devolutions)

table 50904 "Car Entry Order"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Description = 'It is the key number of the document.';          
        }
        field(2; "Car No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Car."No.";
            Description = 'It is the field that will reference the vehicle.';
        }
        field(3; "Posting date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'It is the field that will record the date of the document.';
        }
        field(4; "Rent date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'It is the field with the date of the vehicle rental.';
        }
        field(5; "Devolution date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'It is the field with the date on which the vehicle is returned.';

            trigger OnValidate()
            begin

                // The Devolution date could not be prior to the rental date 
                if "Devolution date" < "Rent date" then 
                    Error('The devolution date should be modified, it cannot be prior to the rental date.');

            end;
        }
        field(6; "Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Open", "Closed";
            Description = 'This field indicates whether the document admits further modifications.';
        }
        field(7; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'This field contains a small description related to the document.';
        }
        field(8; "Rent Description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'This document contains a brief description of the rental movement.';
        }
        field(9; "Devolution description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'This field contains a small description related to the devolution movement.';
        }
        field(10; "Customer no."; Code[20])
        {
            // In the exercise it appears as Code[10], 
            // but checking the code of the Customer table, it is a Code[20]
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }

    }
    
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
    
    trigger OnInsert()
    begin
        
        if Rec."Posting date" =  0D then
                Rec."Posting date" := Today;

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