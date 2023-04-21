import {
	Box,
	Button,
	Checkbox,
	Divider,
	Grid,
	Stack,
	TextField,
	Typography,
} from '@mui/material';
import { Container } from '@mui/system';
import React from 'react';
import solidLightBackground from '../../public/hero-solid-light.jpg';

export const Form = ({
	title,
	notice,
}: {
	title: string;
	notice: { newsletter: string; privacy: string };
}) => (
	<Box
		component="section"
		sx={{
			backgroundImage: `url(${solidLightBackground})`,
			backgroundSize: 'cover',
			backgroundPosition: 'center',
		}}
	>
		<Container maxWidth="sm">
			<Grid container justifyContent="center">
				<Grid item xs={10}>
					<form>
						<Typography
							variant="h3"
							pt={8}
							mb={4}
							textAlign="center"
						>
							{title}
						</Typography>
						<Stack spacing={2} mb={4}>
							<TextField
								placeholder="Nome e Cognome"
								variant="outlined"
								size="small"
								sx={{
									backgroundColor: 'white',
								}}
							/>
							<TextField
								placeholder="Indirizzo e-mail"
								variant="outlined"
								size="small"
								sx={{
									backgroundColor: 'white',
								}}
							/>
							<TextField
								placeholder="Nome ente"
								variant="outlined"
								size="small"
								sx={{
									backgroundColor: 'white',
								}}
							/>
						</Stack>
						<Grid container mb={1}>
							<Grid item xs={11}>
								<Typography variant="caption" >
									{notice.newsletter}
								</Typography>
							</Grid>
							<Grid item xs={1}>
								<Checkbox />
							</Grid>
						</Grid>
						<Divider />
						<Stack spacing={4} pt={4} pb={8}>
							<Stack direction="row" justifyContent="center">
								<Button variant="contained" color="primary">
									Invia Richiesta
								</Button>
							</Stack>
							<Typography
								variant="caption-semibold"

								textAlign="center"
							>
								{notice.privacy}
							</Typography>
						</Stack>
					</form>
				</Grid>
			</Grid>
		</Container>
	</Box>
);
