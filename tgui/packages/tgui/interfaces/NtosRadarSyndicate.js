<<<<<<< HEAD
=======
import { Fragment } from 'inferno';
import { useBackend } from '../backend';
import { classes } from 'common/react';
import { Box, Button, LabeledList, NoticeBox, Section, Table, Flex, Icon } from '../components';
>>>>>>> master
import { NtosWindow } from '../layouts';
import { NtosRadarContent } from './NtosRadar';

export const NtosRadarSyndicate = (props, context) => {
  return (
<<<<<<< HEAD
    <NtosWindow
      width={800}
      height={600}
      theme="syndicate">
      <NtosRadarContent />
    </NtosWindow>
  );
};
=======
    <NtosWindow theme="syndicate">
      <NtosRadarContent />
    </NtosWindow>
  );
};
>>>>>>> master
