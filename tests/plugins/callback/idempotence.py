# -*- coding: utf-8 -*-

from __future__ import (absolute_import, print_function)

import sys
import os

from ansible import constants as C
from ansible.constants import mk_boolean

try:
    from ansible.plugins.callback import CallbackBase
    parent = CallbackBase
except ImportError:
    parent = object


VAR_IDEMPOTENCE = u'IDEMPOTENCE'


class CallbackModule(parent):
    """
    This callback module performs the idempotency test whenever the 'idempotency' variable is set to True.
    """
    CALLBACK_VERSION = 2.0
    CALLBACK_NAME = 'idempotency'

    def __init__(self):
        self.playbook = None
        self.enabled = mk_boolean(os.getenv(VAR_IDEMPOTENCE, 'no'))

        super(CallbackModule, self).__init__()

    def playbook_on_stats(self, stats):

        if self.enabled:
            if len(stats.dark) > 0:
                self._display.warning('idempotency test failed: unreachable=%s > 0' % stats.dark)
                sys.exit(os.EX_SOFTWARE)
            if len(stats.changed) > 0:
                self._display.warning('idempotency test failed: changed=%s > 0' % stats.changed)
                sys.exit(os.EX_SOFTWARE)
            if len(stats.failures) > 0:
                self._display.warning('idempotency test failed: failures=%s > 0' % stats.failures)
                sys.exit(os.EX_SOFTWARE)

    def v2_playbook_on_stats(self, stats):
        """Verify that playbook ran without any changes or failures."""
        self.playbook_on_stats(stats)

