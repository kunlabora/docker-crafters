import express, { Request, Response } from 'express';
import cors from 'cors'; // Import cors middleware

const app = express();
const port = 3000;

app.use(cors());

app.get('/api/greet', (req: Request, res: Response) => {
  res.json({ message: 'Thundercats are on the move. Thundercats are loose!' });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

