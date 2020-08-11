<<<<<<< HEAD
import { classes } from 'common/react';
import { resolveAsset } from '../assets';
import { useBackend } from '../backend';
import { Box, Button, Flex, Icon, NoticeBox, Section } from '../components';
=======
import { Fragment } from 'inferno';
import { useBackend } from '../backend';
import { classes } from 'common/react';
import { Box, Button, LabeledList, NoticeBox, Section, Table, Flex, Icon } from '../components';
>>>>>>> master
import { NtosWindow } from '../layouts';

export const NtosRadar = (props, context) => {
  return (
<<<<<<< HEAD
    <NtosWindow
      width={800}
      height={600}
      theme="ntos">
=======
    <NtosWindow theme="ntos">
>>>>>>> master
      <NtosRadarContent />
    </NtosWindow>
  );
};

export const NtosRadarContent = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    selected,
    object = [],
    target = [],
    scanning,
  } = data;
<<<<<<< HEAD
  return (
    <Flex
=======

  return (
    <Flex 
>>>>>>> master
      direction={"row"}
      hight="100%">
      <Flex.Item
        position="relative"
        width={20.5}
        hight="100%">
        <NtosWindow.Content scrollable>
          <Section>
            <Button
              icon="redo-alt"
              content={scanning?"Scanning...":"Scan"}
              color="blue"
              disabled={scanning}
              onClick={() => act('scan')} />
            {!object.length && !scanning && (
              <div>
                No trackable signals found
              </div>
            )}
            {!scanning && object.map(object => (
              <div
                key={object.dev}
                title={object.name}
                className={classes([
                  'Button',
                  'Button--fluid',
                  'Button--color--transparent',
                  'Button--ellipsis',
                  object.ref === selected
                    && 'Button--selected',
                ])}
                onClick={() => {
                  act('selecttarget', {
                    ref: object.ref,
                  });
                }}>
                {object.name}
              </div>
            ))}
          </Section>
        </NtosWindow.Content>
      </Flex.Item>
      <Flex.Item
        style={{
<<<<<<< HEAD
          'background-image': 'url("'
            + resolveAsset('ntosradarbackground.png')
            + '")',
=======
          'background-image': 'url("ntosradarbackground.png")',
>>>>>>> master
          'background-position': 'center',
          'background-repeat': 'no-repeat',
          'top': '20px',
        }}
        position="relative"
        m={1.5}
        width={45}
        height={45}>
        {Object.keys(target).length === 0
          ? !!selected && (
            <NoticeBox
              position="absolute"
              top={20.6}
              left={1.35}
              width={42}
              fontSize="30px"
              textAlign="center">
              Signal Lost
            </NoticeBox>
          )
          : !!target.userot && (
            <Box as="img"
<<<<<<< HEAD
              src={resolveAsset(target.arrowstyle)}
=======
              src={target.arrowstyle}
>>>>>>> master
              position="absolute"
              top="20px"
              left="243px"
              style={{
                'transform': `rotate(${target.rot}deg)`,
<<<<<<< HEAD
              }} />
=======
              }}
            />
>>>>>>> master
          ) || (
            <Icon
              name={target.pointer}
              position="absolute"
              size={2}
              color={target.color}
<<<<<<< HEAD
              top={((target.locy * 10) + 19) + 'px'}
              left={((target.locx * 10) + 16) + 'px'} />
=======
              top={((target.locy * 10) + 29) + 'px'}
              left={((target.locx * 10) + 16) + 'px'}
            />
>>>>>>> master
          )}
      </Flex.Item>
    </Flex>
  );
};
