package Promises;
use 5.16.1;

# ABSTRACT: An implementation of Promises in Perl

use warnings;
use mop;

use Scalar::Util qw[ blessed ];
use Carp         qw[ confess ];

class Promise {

    has $!deferred = die "You must supply an instance of Promises::Deferred";

    method new($class: $x) { $class->next::method( deferred => $x ); }

    method then    { $!deferred->then( @_ ) }
    method status  { $!deferred->status     }
    method result  { $!deferred->result     }

    method is_unfulfilled { $!deferred->is_unfulfilled }
    method is_fulfilled   { $!deferred->is_fulfilled   }
    method is_failed      { $!deferred->is_failed      }

    method is_in_progress { $!deferred->is_in_progress }
    method is_resolving   { $!deferred->is_resolving   }
    method is_rejecting   { $!deferred->is_rejecting   }
    method is_resolved    { $!deferred->is_resolved    }
    method is_rejected    { $!deferred->is_rejected    }

}
1;

__END__

=head1 DESCRIPTION

Promise objects are typically not created by hand, they
are typically returned from the C<promise> method of
a L<Promises::Deferred> instance. It is best to think
of a L<Promises::Promise> instance as a handle for
L<Promises::Deferred> instances.

Most of the documentation here points back to the
documentation in the L<Promises::Deferred> module.

Additionally the L<Promises> module contains a long
explanation of how this module, and all it's components
are meant to work together.

=head1 METHODS

=over 4

=item C<new( $deferred )>

The constructor only takes one parameter and that is an
instance of L<Promises::Deferred> that you want this
object to proxy.

=item C<then( $callback, $error )>

This calls C<then> on the proxied L<Promises::Deferred> instance.

=item C<status>

This calls C<status> on the proxied L<Promises::Deferred> instance.

=item C<result>

This calls C<result> on the proxied L<Promises::Deferred> instance.

=item C<is_unfulfilled>

This calls C<is_unfulfilled> on the proxied L<Promises::Deferred> instance.

=item C<is_fulfilled>

This calls C<is_fulfilled> on the proxied L<Promises::Deferred> instance.

=item C<is_failed>

This calls C<is_failed> on the proxied L<Promises::Deferred> instance.

=item C<is_in_progress>

This calls C<is_in_progress> on the proxied L<Promises::Deferred> instance.

=item C<is_resolving>

This calls C<is_resolving> on the proxied L<Promises::Deferred> instance.

=item C<is_rejecting>

This calls C<is_rejecting> on the proxied L<Promises::Deferred> instance.

=item C<is_resolved>

This calls C<is_resolved> on the proxied L<Promises::Deferred> instance.

=item C<is_rejected>

This calls C<is_rejected> on the proxied L<Promises::Deferred> instance.

=back

