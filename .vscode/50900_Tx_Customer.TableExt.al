tableextension 50900 Tx_Customer extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50900; "Default Car No."; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = Car."No.";
        }
    }
    
    // var
    //     myInt: Integer;
    
}