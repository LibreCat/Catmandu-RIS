requires 'perl', '5.008005';

requires 'Catmandu','0.94';
requires 'Encode';

on build => sub {
	requires 'Module::Build', '0.3601';
};

on configure => sub {
	requires 'Module::Build', '0.3601';
};

on test => sub {
    requires 'Test::More', '0.96';
};
