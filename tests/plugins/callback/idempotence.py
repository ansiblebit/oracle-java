import sys
import os

VAR_IDEMPOTENCE = u'idempotence'


class CallbackModule(object):
    """
    This callback module performs the idempotence test whenever the 'idempotence' variable is set to True.
    """

    def __init__(self):
        pass

    def playbook_on_stats(self, stats):

        if (u'%s' % VAR_IDEMPOTENCE) in self.playbook.extra_vars.keys() and self.playbook.extra_vars[VAR_IDEMPOTENCE]:

            if len(stats.dark) > 0:
                print ('idempotence test failed! unreachable=%s > 0') % stats.dark
                sys.exit(os.EX_SOFTWARE)

            if len(stats.changed) > 0:
                print ('idempotence test failed! changed=%s > 0') % stats.changed
                sys.exit(os.EX_SOFTWARE)

            if len(stats.failures) > 0:
                print ('idempotence test failed! failures=%s > 0') % stats.failures
                sys.exit(os.EX_SOFTWARE)
