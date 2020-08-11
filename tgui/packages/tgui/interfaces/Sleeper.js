import { useBackend } from '../backend';
<<<<<<< HEAD
import { AnimatedNumber, Box, Section, LabeledList, Button, ProgressBar } from '../components';
import { Fragment } from 'inferno';
import { Window } from '../layouts';

const damageTypes = [
  {
    label: 'Brute',
    type: 'bruteLoss',
  },
  {
    label: 'Burn',
    type: 'fireLoss',
  },
  {
    label: 'Toxin',
    type: 'toxLoss',
  },
  {
    label: 'Oxygen',
    type: 'oxyLoss',
  },
];

export const Sleeper = (props, context) => {
  const { act, data } = useBackend(context);
=======
import { Box, Section, LabeledList, Button, ProgressBar, AnimatedNumber } from '../components';
import { Fragment } from 'inferno';
import { Window } from '../layouts';

export const Sleeper = (props, context) => {
  const { act, data } = useBackend(context);

>>>>>>> master
  const {
    open,
    occupant = {},
    occupied,
  } = data;
<<<<<<< HEAD
=======

>>>>>>> master
  const preSortChems = data.chems || [];
  const chems = preSortChems.sort((a, b) => {
    const descA = a.name.toLowerCase();
    const descB = b.name.toLowerCase();
    if (descA < descB) {
      return -1;
    }
    if (descA > descB) {
      return 1;
    }
    return 0;
  });
  const preSortSynth = data.synthchems || [];
  const synthchems = preSortSynth.sort((a, b) => {
    const descA = a.name.toLowerCase();
    const descB = b.name.toLowerCase();
    if (descA < descB) {
      return -1;
    }
    if (descA > descB) {
      return 1;
    }
    return 0;
  });
<<<<<<< HEAD
  return (
    <Window
      width={310}
      height={465}>
=======

  const damageTypes = [
    {
      label: 'Brute',
      type: 'bruteLoss',
    },
    {
      label: 'Burn',
      type: 'fireLoss',
    },
    {
      label: 'Toxin',
      type: 'toxLoss',
    },
    {
      label: 'Oxygen',
      type: 'oxyLoss',
    },
  ];

  return (
    <Window>
>>>>>>> master
      <Window.Content>
        <Section
          title={occupant.name ? occupant.name : 'No Occupant'}
          minHeight="210px"
          buttons={!!occupant.stat && (
            <Box
              inline
              bold
              color={occupant.statstate}>
              {occupant.stat}
            </Box>
          )}>
          {!!occupied && (
            <Fragment>
              <ProgressBar
                value={occupant.health}
                minValue={occupant.minHealth}
                maxValue={occupant.maxHealth}
                ranges={{
                  good: [50, Infinity],
                  average: [0, 50],
                  bad: [-Infinity, 0],
                }} />
              <Box mt={1} />
              <LabeledList>
                {damageTypes.map(type => (
                  <LabeledList.Item
                    key={type.type}
                    label={type.label}>
                    <ProgressBar
                      value={occupant[type.type]}
                      minValue={0}
                      maxValue={occupant.maxHealth}
                      color="bad" />
                  </LabeledList.Item>
                ))}
                <LabeledList.Item
                  label={'Blood'}>
                  <ProgressBar
                    value={data.blood_levels/100}
                    color="bad">
                    <AnimatedNumber value={data.blood_levels} />
                  </ProgressBar>
                  {data.blood_status}
                </LabeledList.Item>
                <LabeledList.Item
                  label="Cells"
                  color={occupant.cloneLoss ? 'bad' : 'good'}>
                  {occupant.cloneLoss ? 'Damaged' : 'Healthy'}
                </LabeledList.Item>
                <LabeledList.Item
                  label="Brain"
                  color={occupant.brainLoss ? 'bad' : 'good'}>
                  {occupant.brainLoss ? 'Abnormal' : 'Healthy'}
                </LabeledList.Item>
              </LabeledList>
            </Fragment>
          )}
        </Section>
        <Section title="Chemical Analysis">
          <LabeledList.Item label="Chemical Contents">
            {data.chemical_list.map(specificChem => (
              <Box
                key={specificChem.id}
                color="good" >
                {specificChem.volume} units of {specificChem.name}
              </Box>
            ),
            )}
          </LabeledList.Item>
        </Section>
        <Section
<<<<<<< HEAD
          title="Medicines"
          minHeight="205px"
=======
          title="Inject Chemicals"
          minHeight="105px"
>>>>>>> master
          buttons={(
            <Button
              icon={open ? 'door-open' : 'door-closed'}
              content={open ? 'Open' : 'Closed'}
              onClick={() => act('door')} />
          )}>
          {chems.map(chem => (
            <Button
              key={chem.name}
              icon="flask"
              content={chem.name}
<<<<<<< HEAD
              disabled={!occupied || !chem.allowed}
              width="140px"
              onClick={() => act('inject', {
                chem: chem.id,
              })} />
=======
              disabled={!(occupied && chem.allowed)}
              width="140px"
              onClick={() => act('inject', {
                chem: chem.id,
              })}
            />
>>>>>>> master
          ))}
        </Section>
        <Section
          title="Synthesize Chemicals">
          {synthchems.map(chem => (
            <Button
              key={chem.name}
              content={chem.name}
              width="140px"
              onClick={() => act('synth', {
                chem: chem.id,
              })}
            />
          ))}
        </Section>
        <Section
          title="Purge Chemicals">
          {chems.map(chem => (
            <Button
              key={chem.name}
              content={chem.name}
              disabled={!(chem.allowed)}
              width="140px"
              onClick={() => act('purge', {
                chem: chem.id,
              })}
            />
          ))}
        </Section>
      </Window.Content>
    </Window>
  );
};
