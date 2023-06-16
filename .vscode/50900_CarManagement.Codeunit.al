codeunit 50900 "Car Management"
{
    
    // trigger OnRun()
    // begin
        
    // end;
    
    // var
    //     myInt: Integer;


    procedure CarPostRent(CarEntryOrderRecord: Record "Car Entry Order")
    var 
        CarEntryRecord: Record "Car Entry";

    begin

        CarEntryRecord.Init();
        CarEntryRecord.SetRange("Car no.", CarEntryOrderRecord."Car No.");

        if CarEntryRecord.FindLast() then
            // Checking that the last movement of the vehicle is not of type Rent
            if CarEntryRecord."Entry type" = CarEntryRecord."Entry type"::Rent then 
                    Error('The car is already rented');


        // Create a new movement for the car in "Car Entry" Table
        CarEntryRecord.Init();
        CarEntryRecord.Validate("No.", 0); // this will trigger the auto-increment to get the next number
        CarEntryRecord.Validate("Car no.", CarEntryOrderRecord."Car No.");
        CarEntryRecord.Validate("Posting date", CarEntryOrderRecord."Rent date");
        CarEntryRecord.Validate(Description, CarEntryOrderRecord."Rent Description");
        CarEntryRecord.Validate("Entry type", CarEntryRecord."Entry type"::Rent);
        CarEntryRecord.Validate("Customer no.", CarEntryOrderRecord."Customer no.");

        CarEntryRecord.Insert(true);

    end;

    procedure CarPostDevolution(CarEntryOrderRecord: Record "Car Entry Order")
    var 
        CarEntryRecord: Record "Car Entry";

    begin

        // Before creating the vehicle movement, it must be checked that 
        // the Devolution date is not prior to the rental date 
        // ("Devolution date" < "Rent date")
   
        if CarEntryOrderRecord."Devolution date" >= CarEntryOrderRecord."Rent date" then begin

            CarEntryRecord.Init();
            CarEntryRecord.SetRange("Car no.", CarEntryOrderRecord."Car No.");

            if CarEntryRecord.FindLast() then
                if CarEntryRecord."Entry type" = CarEntryRecord."Entry type"::Devolution then
                    Error('The vehicle is not rented')
                    
        end else 
                Error('The devolution date should be modified, it cannot be prior to the rental date.');

        // Create a new movement for the car in "Car Entry" Table
        CarEntryRecord.Init();
        CarEntryRecord.Validate("No.", 0); // this will trigger the auto-increment to get the next number
        CarEntryRecord.Validate("Car no.", CarEntryOrderRecord."Car No.");
        CarEntryRecord.Validate("Posting date", CarEntryOrderRecord."Devolution date");
        CarEntryRecord.Validate(Description, CarEntryOrderRecord."Devolution description");
        CarEntryRecord.Validate("Entry type", CarEntryRecord."Entry type"::Devolution);
        CarEntryRecord.Validate("Customer no.", CarEntryOrderRecord."Customer no.");

        CarEntryRecord.Insert(true);
                  
    end;

    procedure CarPostTechnicalCheck(CarNumber: Integer; CheckDate: Date)
    var 
        CarEntryRecord: Record "Car Entry";
    
    begin

        CarEntryRecord.Init();
        CarEntryRecord.SetRange("Car no.", CarNumber);

        if CarEntryRecord.FindLast() then
            if CarEntryRecord."Entry type" <> CarEntryRecord."Entry type"::Rent then 
                    Error('The vehicle is rented and maintenance could not be done at this time.');
                       
        // Create a new "Car Entry Record"
        CarEntryRecord.Init();
        CarEntryRecord.Validate("No.", 0); // this will trigger the auto-increment to get the next number
        CarEntryRecord.Validate("Car no.", CarNumber);
        CarEntryRecord.Validate("Posting date", CheckDate);
        CarEntryRecord.Validate("Entry type", CarEntryRecord."Entry type"::"Technical check");

        CarEntryRecord.Insert(true);

    end;
}