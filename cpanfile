requires 'perl', 'v5.10.1';

requires 'Moo', 0;
requires 'namespace::clean', 0;
requires 'Catmandu', 0;
requires 'Catmandu::Importer::CSV', 0;

on build => sub {
	requires 'Module::Build', '0.3601';
};

on configure => sub {
	requires 'Module::Build', '0.3601';
};

on test => sub {
    requires 'Test::More', '0.96';
};
