# NAME

Catmandu::RIS -  Catmandu modules for working with RIS data

# STATUS

![Test status](https://github.com/LibreCat/Catmandu-RIS/actions/workflows/linux.yml/badge.svg)
[![Coverage](https://coveralls.io/repos/LibreCat/Catmandu-RIS/badge.png?branch=master)](https://coveralls.io/r/LibreCat/Catmandu-RIS)
[![CPANTS kwalitee](http://cpants.cpanauthors.org/dist/Catmandu-RIS.png)](http://cpants.cpanauthors.org/dist/Catmandu-RIS)

# SYNOPSIS

    catmandu convert RIS < input.txt

    # Use the --human option to translate RIS tags into human readable strings
    catmandu convert RIS --human 1 < input.txt

    # Provide a comma separated mapping file to translate RIS tags
    catmandu convert RIS --human mappings/my_tags.txt < input.txt

# MODULES

- [Catmandu::Exporter::RIS](https://metacpan.org/pod/Catmandu%3A%3AExporter%3A%3ARIS)
- [Catmandu::Importer::RIS](https://metacpan.org/pod/Catmandu%3A%3AImporter%3A%3ARIS)

# MAPPING

See the examples in the package [https://github.com/LibreCat/Catmandu-RIS/tree/master/examples](https://github.com/LibreCat/Catmandu-RIS/tree/master/examples)
for some hints how to create a mapping.

# Author

Nicolas Steenlant

# CONTRIBUTORS

Vitali Peil

Patrick Hochstenbach

Nicolas Franck

Mohammad S Anwar

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[Catmandu](https://metacpan.org/pod/Catmandu), [Catmandu::Exporter](https://metacpan.org/pod/Catmandu%3A%3AExporter), [Catmandu::Importer](https://metacpan.org/pod/Catmandu%3A%3AImporter)

## for other bibliographic formats

[Catmandu::BibTeX](https://metacpan.org/pod/Catmandu%3A%3ABibTeX)
