# @since 1.0.0
type ShellInABox::Type::Service = Variant[Enum['LOGIN', 'SSH'], Tuple[Enum['SSH'], Bodgitlib::Host, 1, 2], Tuple[String, String, Variant[Enum['HOME'], Stdlib::Absolutepath], Variant[Enum['SHELL'], String]]]
