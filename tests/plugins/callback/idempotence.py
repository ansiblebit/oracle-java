import sys
import os


class CallbackModule(object):
    """
    This callback module tells you how long your plays ran for.
    """

    def __init__(self):
        pass

    def playbook_on_stats(self, stats):

        if u'idempotence' in self.playbook.extra_vars.keys():

            if (len(stats.changed) > 0):
                print 'idempotence test failed! changed=%s > 0' % stats.changed
                sys.exit(os.EX_SOFTWARE)

            if (len(stats.failures) > 0):
                print 'idempotence test failed! failures=%s > 0' % stats.failures
                sys.exit(os.EX_SOFTWARE)
