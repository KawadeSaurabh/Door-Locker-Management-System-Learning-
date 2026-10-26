table 50456 "Seed Master"
{
    Caption = 'Seed Master';
    DataClassification = CustomerContent;
    DrillDownPageId = "Seed QC Test List";

    fields
    {
        field(1; "Seed Code"; Code[20])
        {
            Caption = 'Seed Code';
            NotBlank = true;
        }
        field(2; "Seed Name"; Text[100])
        {
            Caption = 'Seed Name';
            NotBlank = true;

            trigger OnValidate()
            begin
                if "Seed Name" = '' then
                    Error('Seed name cannot be blank');
            end;
        }

        field(3; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive;
            InitValue = Active;
        }

        field(4; "QC Test Count"; Integer)
        {
            Caption = 'QC Test Count';
            FieldClass = FlowField;
            CalcFormula = count("Seed QC Test" where("Seed Code" = field("Seed Code")));
            Editable = false;
        }

        field(5; "QC Lot Filter"; Date)
        {
            Caption = 'QC Test Date Filter';
            FieldClass = FlowFilter;
        }

        field(6; "Filtered QC Count"; Integer)
        {
            Caption = 'Demo QC Count';
            FieldClass = FlowField;
            CalcFormula = count("Seed QC Test" where(
                "Seed Code" = field("Seed Code"),
                "Lot No." = field("QC Lot Filter")));
        }
    }

    keys
    {
        key(PK; "Seed Code")
        {
            Clustered = true;
        }

        key(SeedNameKey; "Seed Name")
        {

        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Seed Code", "Seed Name")
        {

        }
    }


    procedure ShowQCTests()
    var
        SeedQCTest: Record "Seed QC Test";
    begin
        SeedQCTest.SetRange("Seed Code", "Seed Code");
        Page.Run(Page::"Seed QC Test List", SeedQCTest);
    end;

    procedure TestSeedNameSorting()
    var
        Seed: Record "Seed Master";
    begin
        Seed.SetCurrentKey("Seed Name");
        Seed.SetAscending("Seed Name", false);

        if Seed.FindSet() then
            repeat
                Message('%1 - %2', Seed."Seed Code", Seed."Seed Name");
            until Seed.Next() = 0
        else
            Message('No seed record found.');
    end;

    procedure TestQCTestCount()
    var
        Seed: Record "Seed Master";
    begin
        if Seed.FindSet() then
            repeat
                Seed.CalcFields("QC Test Count");
                Message(
                    'Seed: %1\QC Test Count: %2',
                    Seed."Seed Name",
                    Seed."QC Test Count");
            until Seed.Next() = 0
        else
            Message('No seed record found.');

    end;


    trigger OnInsert()
    begin
        Message('A new seed record has been inserted.');
    end;

    trigger OnModify()
    begin
        Message('An existing seed record has been modified.');
    end;

    trigger OnDelete()
    begin
        Message('The seed record is being created.');
    end;

    trigger OnRename()
    begin
        Message('The seed code has been changed.');
    end;

}
