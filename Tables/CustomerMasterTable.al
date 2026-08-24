table 50452 "Locker Customer"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Customer No."; Code[20])
        {

        }
        field(2; "Customer Name"; Text[100])
        {

        }
        field(3; "Mobile No."; Code[15])
        {

        }
        field(4; City; Text[50])
        {

        }
        field(5; Active; Boolean)
        {

        }
    }

    keys
    {
        key(PK; "Customer No.")
        {
            Clustered = true;
        }
    }
}