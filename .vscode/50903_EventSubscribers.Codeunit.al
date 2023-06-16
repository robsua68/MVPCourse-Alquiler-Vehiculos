codeunit 50903 "Event Subscribers"
{
    trigger OnRun()
    begin
        
    end;
    

    [EventSubscriber(ObjectType::Table, Database::"Car", 'OnAfterValidateEvent', 'Name', true, true)]
    local procedure CarOnAfterValidateCarName()
    var
        ExtendedName: Text[40];
        CarRecord: Record Car;
    
    begin

        ExtendedName := CarRecord.Name + ' - '  + CarRecord."Brand Code";

        CarRecord."Extended Name" := ExtendedName;

        CarRecord.CheckBrand();

    end;

    [EventSubscriber(ObjectType::Table, Database::"Car", 'OnAfterValidateEvent', 'Brand Code', true, true)]
    local procedure CarOnAfterValidateBrandCarName()
    var
        ExtendedName: Text[40];
        CarRecord: Record Car;
    
    begin

        ExtendedName := CarRecord.Name + ' - '  + CarRecord."Brand Code";

        CarRecord."Extended Name" := ExtendedName;

        CarRecord.CheckBrand();

    end;

    [EventSubscriber(ObjectType::Table, Database::"Car", 'OnAfterValidateEvent', 'Gears', true, true)]
    local procedure CarOnAfterValidateGears()
    var
        CarRecord: Record Car;

    begin

        CarRecord.CheckBrand();

    end;

    [EventSubscriber(ObjectType::Table, Database::"Car", 'OnAfterValidateEvent', 'Engine Power', true, true)]
    local procedure CarOnAfterValidateEnginePower()
    var
        CarRecord: Record Car;

    begin

        CarRecord.CheckBrand();

    end;

    [EventSubscriber(ObjectType::Table, Database::"Car", 'OnAfterValidateEvent', 'Electric', true, true)]
    local procedure CarOnAfterValidateElectric()
    var
        CarRecord: Record Car;

    begin

        CarRecord.CheckBrand();

    end;

    [EventSubscriber(ObjectType::Table, Database::"Car", 'OnAfterValidateEvent', 'Acquisition Date', true, true)]
    local procedure CarOnAfterValidateAdquisitionDate()
    var
        CarRecord: Record Car;

    begin

        CarRecord.CheckBrand();

    end;

    [EventSubscriber(ObjectType::Table, Database::"Car", 'OnAfterValidateEvent', 'Plate', true, true)]
    local procedure CarOnAfterValidatePlate()
    var
        CarRecord: Record Car;

    begin

        CarRecord.CheckBrand();

    end;

    [EventSubscriber(ObjectType::Table, Database::"Car", 'OnAfterValidateEvent', 'Extended Name', true, true)]
    local procedure CarOnAfterValidateExtendedName()
    var
        CarRecord: Record Car;

    begin

        CarRecord.CheckBrand();

    end;

    [EventSubscriber(ObjectType::Table, Database::"Car", 'OnAfterInsertEvent', '', true, true)]
    local procedure CarOnAfterInsertEvent()
    begin
        Message('Se ha creado un nuevo vehículo');
    end;

}