import { useBackend, useSharedState } from '../backend';
import { map } from 'common/collections';
import { Section, Tabs, Table, Button, Box, NoticeBox, Divider } from '../components';
import { Fragment } from 'inferno';
import { Window } from '../layouts';

let REC_RATVAR = "";
<<<<<<< HEAD
// You may ask "why is this not inside ClockworkSlab"
// It's because cslab gets called every time. Lag is bad.
for (let index = 0; index < Math.min(Math.random()*100); index++) {
  REC_RATVAR += "HONOR RATVAR ";
=======
for (let index = 0; index < Math.min(Math.random()*100); index++) {
  // HEY! is it faster to do it serverside or client side?
  REC_RATVAR.concat("HONOR RATVAR ");
>>>>>>> master
}

export const ClockworkSlab = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    recollection = true,
    recollection_categories = [],
    rec_section = null,
    rec_binds = [],
<<<<<<< HEAD
    scripture = {},
=======
    scripture = {}, // this is a {}, not a []
>>>>>>> master
    tier_infos = {},
    power = "0 W",
    power_unformatted = 0,
    HONOR_RATVAR = false, // is ratvar free yet?
  } = data;
  const [
    tab,
    setTab,
  ] = useSharedState(context, 'tab', 'Application');
  const scriptInTab = scripture
  && scripture[tab]
  || [];
  const tierInfo = tier_infos
  && tier_infos[tab]
  || {};

  return (
<<<<<<< HEAD
    <Window
      theme="clockcult"
      width={800}
      height={420}>
=======
    <Window theme="clockcult">
>>>>>>> master
      <Window.Content scrollable>
        {recollection ? ( // tutorial
          <Section
            title="Recollection"
            buttons={(
              <Button
                content="Recital"
                icon="cog"
                tooltipPosition={"left"}
                onClick={() => act('toggle')} />
            )}>
            <Box>
              {HONOR_RATVAR ? (
                <Box
                  as="span"
                  textColor="#BE8700"
                  fontSize={2}
                  bold>
                  {REC_RATVAR}
                </Box>
              ) : (
                <Fragment>
                  <Box
                    as="span"
                    textColor="#BE8700"
                    fontSize={2} // 2rem
                    bold>
                    Chetr nyy hagehguf naq ubabe Ratvar.
                  </Box>
                  <NoticeBox>
                    NOTICE: This information is out of date.
                    Read the Ark &amp; You primer in your backpack
                    or read the wiki page for current info.
                  </NoticeBox>
                  <Box>
                    These pages serve as the archives of Ratvar, the
                    Clockwork Justiciar. This section of your slab
                    has information on being as a Servant, advice
                    for what to do next, and pointers for serving the
                    master well. You should recommended that you check this
                    area for help if you get stuck or need guidance on
                    what to do next.
                    <br /> <br />
                    Disclaimer: Many objects, terms, and phrases, such as
                    Servant, Cache, and Slab, are capitalized like proper
                    nouns. This is a quirk of the Ratvarian language do
                    not let it confuse you! You are free to use the names
                    in pronoun form when speaking in normal languages.
                  </Box>
                </Fragment>
              )}
            </Box>
<<<<<<< HEAD
            {recollection_categories?.map(cat => (
              <Fragment key={cat.name}>
                <br />
                <Button
                  content={cat.name}
                  tooltip={cat.desc}
                  tooltipPosition={'right'}
                  onClick={() => act('rec_category', {
                    "category": cat.name,
                  })} />
              </Fragment>
            ))}
            <Divider />
            <Box>
=======
            {recollection_categories?.map(cat => {
              return (
                <Fragment key={cat.name} >
                  <br />
                  <Button
                    content={cat.name}
                    tooltip={cat.desc}
                    tooltipPosition={'right'}
                    onClick={() => act('rec_category', {
                      "category": cat.name,
                    })} />
                </Fragment>
              );
            })}
            <Divider />
            <Box>
              {data.rec_section}
>>>>>>> master
              <Box
                as={'span'}
                textColor={'#BE8700'}
                fontSize={2.3}>
                {rec_section?.title ? (
                  rec_section.title
                ) : (
<<<<<<< HEAD
                  '500 Slab Internal archives not found.'
=======
                  '500 Server Internal archives not found.'
>>>>>>> master
                )}
              </Box>
              <br /><br />
              {rec_section?.info ? (
                rec_section.info
              ) : (
                "One of the cogscarabs must've misplaced this section."
              )}
            </Box>
            <br />
            <Divider />
            <Box>
              <Box
                as={'span'}
                textColor={'#BE8700'}
                fontSize={2.3}>
                Quickbound Scripture
              </Box>
              <br />
              <Box as={'span'} italic>
                You can have up to five scriptures bound to
                action buttons for easy use.
              </Box>
              <br /><br />
              {rec_binds?.map(bind => (
                <Fragment key={bind.name ? bind.name : "none"}>
                  A <b>Quickbind</b> slot ({rec_binds.indexOf(bind)+1}),
                  currently set to&nbsp;
                  <span style={`color:${bind ? bind.color : "#BE8700"}`}>
                    {bind?.name ? bind.name : "None"}
                  </span>
                  .
                  <br />
                </Fragment>
              ))}
            </Box>
          </Section>
        ) : (
          <Section
            title="Power"
            buttons={(
              <Button
                content="Recollection"
                icon="book"
                tooltip={"Tutorial"}
                tooltipPosition={"left"}
                onClick={() => act('toggle')} />
            )}>
            <b>{power}</b> power is available for scripture
            and other consumers.
            <Section level={2}>
              <Tabs>
<<<<<<< HEAD
                {map((scriptures, name) => (
                  <Tabs.Tab
                    key={name}
                    selected={tab === name}
                    onClick={() => setTab(name)}>
                    {name}
                  </Tabs.Tab>
                ))(scripture)}
=======
                {map((scriptures, name) => {
                  return (
                    <Tabs.Tab
                      key={name}
                      selected={tab === name}
                      onClick={() => setTab(name)}>
                      {name}
                    </Tabs.Tab>
                  );
                })(scripture)}
>>>>>>> master
              </Tabs>
              <Box
                as={'span'}
                textColor={'#B18B25'}
                bold={!!tierInfo.ready} // muh booleans
                italic={!tierInfo.ready}>
                {tierInfo.ready ? (
                  "These scriptures are permanently unlocked."
                ) : (
                  tierInfo.requirement
                )}
              </Box>
              <br />
              <Box as={'span'} textColor={'#DAAA18'}>
                Scriptures in <b>yellow</b> are related to
                construction and building.
              </Box>
              <br />
              <Box as={'span'} textColor={'#6E001A'}>
                Scriptures in <b>red</b> are related to
                attacking and offense.
              </Box>
              <br />
              <Box as={'span'} textColor={'#1E8CE1'}>
                Scriptures in <b>blue</b> are related to
                healing and defense.
              </Box>
              <br />
              <Box as={'span'} textColor={'#AF0AAF'}>
                Scriptures in <b>purple</b> are niche but
                still important!
              </Box>
              <br />
              <Box as={'span'} textColor={'#DAAA18'} italic>
                Scriptures with italicized names are
                important to success.
              </Box>
              <Divider />
              <Table>
<<<<<<< HEAD
                {scriptInTab?.map(script => (
=======
                {!!scriptInTab && scriptInTab.map(script => (
>>>>>>> master
                  <Table.Row
                    key={script.name}
                    className="candystripe">
                    <Table.Cell
                      italic={!!script.important}
                      color={script.fontcolor}>
                      <b>
                        {script.name}
                      </b>
                      {`
                          ${script.descname}
                          ${script.invokers || ''}
                        `}
                    </Table.Cell>
                    <Table.Cell
                      collapsing
                      textAlign="right">
                      <Button
                        content={`Recite ${script.required}`}
                        disabled={
                          script.required_unformatted >= power_unformatted
                        }
                        tooltip={script.tip}
                        tooltipPosition={'left'}
                        onClick={() => act('recite', {
                          'script': script.type,
                        })} />
                    </Table.Cell>
                    <Table.Cell
                      collapsing
                      textAlign="center">
                      <Button
                        fluid
                        content={script.bound ? (
                          `Unbind ${script.bound}`
                        ) : (
                          'Quickbind'
                        )}
                        disabled={!script.quickbind}
                        onClick={() => act('bind', {
                          'script': script.type,
                        })} />
                    </Table.Cell>
                  </Table.Row>
                ))}
              </Table>
            </Section>
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};
