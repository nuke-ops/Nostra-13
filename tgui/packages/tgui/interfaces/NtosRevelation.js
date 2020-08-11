<<<<<<< HEAD
import { Section, Button, LabeledList } from '../components';
import { useBackend } from '../backend';
import { NtosWindow } from '../layouts';

export const NtosRevelation = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <NtosWindow
      width={400}
      height={250}
      theme="syndicate">
=======
import { Section, Button, LabeledList } from "../components";
import { useBackend } from "../backend";
import { NtosWindow } from "../layouts";

export const NtosRevelation = (props, context) => {
  const { act, data } = useBackend(context);

  return (
    <NtosWindow theme="syndicate">
>>>>>>> master
      <NtosWindow.Content>
        <Section>
          <Button.Input
            fluid
            content="Obfuscate Name..."
<<<<<<< HEAD
            onCommit={(e, value) => act('PRG_obfuscate', {
              new_name: value,
            })}
            mb={1} />
=======
            onCommit={(e, value) => act('PRG_obfuscate', { new_name: value })}
            mb={1}
          />
>>>>>>> master
          <LabeledList>
            <LabeledList.Item
              label="Payload Status"
              buttons={(
                <Button
                  content={data.armed ? 'ARMED' : 'DISARMED'}
                  color={data.armed ? 'bad' : 'average'}
<<<<<<< HEAD
                  onClick={() => act('PRG_arm')} />
              )} />
=======
                  onClick={() => act('PRG_arm')}
                />
              )}
            />
>>>>>>> master
          </LabeledList>
          <Button
            fluid
            bold
            content="ACTIVATE"
            textAlign="center"
            color="bad"
<<<<<<< HEAD
            disabled={!data.armed} />
=======
            disabled={!data.armed}
          />
>>>>>>> master
        </Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
