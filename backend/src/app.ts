import express, { Request, Response } from 'express';

const app = express();
const port = 3000;

app.use(cors());

app.get('/api/greet', (req: Request, res: Response) => {
  res.json({ message: 'Hello from Express!' });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

