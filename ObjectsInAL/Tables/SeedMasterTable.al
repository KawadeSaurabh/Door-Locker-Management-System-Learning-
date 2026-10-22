table 50456 "Seed Master"
{
    Caption = 'Seed Master';
    DataClassification = CustomerContent;
    // LookupPageId = "Seed QC Test List";

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
    }

    keys
    {
        key(PK; "Seed Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Seed Code", "Seed Name")
        {

        }
    }

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
