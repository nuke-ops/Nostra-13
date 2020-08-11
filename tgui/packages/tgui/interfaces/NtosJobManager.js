import { useBackend } from '../backend';
import { Button, Section, Table, NoticeBox, Dimmer, Box } from '../components';
import { NtosWindow } from '../layouts';

export const NtosJobManager = (props, context) => {
  return (
<<<<<<< HEAD
    <NtosWindow
      width={400}
      height={620}
      resizable>
=======
    <NtosWindow resizable>
>>>>>>> master
      <NtosWindow.Content scrollable>
        <NtosJobManagerContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};

export const NtosJobManagerContent = (props, context) => {
  const { act, data } = useBackend(context);
<<<<<<< HEAD
=======

>>>>>>> master
  const {
    authed,
    cooldown,
    slots = [],
    prioritized = [],
  } = data;
<<<<<<< HEAD
=======

>>>>>>> master
  if (!authed) {
    return (
      <NoticeBox>
        Current ID does not have access permissions to change job slots.
      </NoticeBox>
    );
  }
<<<<<<< HEAD
=======

>>>>>>> master
  return (
    <Section>
      {cooldown > 0 && (
        <Dimmer>
          <Box
            bold
            textAlign="center"
            fontSize="20px">
            On Cooldown: {cooldown}s
          </Box>
        </Dimmer>
      )}
      <Table>
        <Table.Row header>
          <Table.Cell>
            Prioritized
          </Table.Cell>
          <Table.Cell>
            Slots
          </Table.Cell>
        </Table.Row>
        {slots.map(slot => (
          <Table.Row
            key={slot.title}
            className="candystripe">
            <Table.Cell
              bold>
              <Button.Checkbox
                fluid
                content={slot.title}
                disabled={slot.total <= 0}
                checked={slot.total > 0 && prioritized.includes(slot.title)}
                onClick={() => act('PRG_priority', {
                  target: slot.title,
<<<<<<< HEAD
                })} />
=======
                })}
              />
>>>>>>> master
            </Table.Cell>
            <Table.Cell collapsing>
              {slot.current} / {slot.total}
            </Table.Cell>
            <Table.Cell collapsing>
              <Button
                content="Open"
                disabled={!slot.status_open}
                onClick={() => act('PRG_open_job', {
                  target: slot.title,
<<<<<<< HEAD
                })} />
=======
                })}
              />
>>>>>>> master
              <Button
                content="Close"
                disabled={!slot.status_close}
                onClick={() => act('PRG_close_job', {
                  target: slot.title,
<<<<<<< HEAD
                })} />
=======
                })}
              />
>>>>>>> master
            </Table.Cell>
          </Table.Row>
        ))}
      </Table>
    </Section>
  );
};
