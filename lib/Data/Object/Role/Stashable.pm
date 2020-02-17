package Data::Object::Role::Stashable;

use 5.014;

use strict;
use warnings;
use routines;

use Moo::Role;

# VERSION

# BUILD

method BUILD($args) {

  return $args;
}

around BUILD($args) {
  $self->$orig($args);

  $self->{'$stash'} = {} if !$self->{'$stash'};

  return $args;
}

# METHODS

method stash($key, $value) {
  return $self->{'$stash'} if !exists $_[0];

  return $self->{'$stash'}->{$key} if !exists $_[1];

  $self->{'$stash'}->{$key} = $value;

  return $value;
}

1;
