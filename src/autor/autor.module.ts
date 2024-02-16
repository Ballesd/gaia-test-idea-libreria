import { Module } from '@nestjs/common';
import { AutorService } from './autor.service';
import { AutorController } from './autor.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  controllers: [AutorController],
  providers: [AutorService],
  imports: [PrismaModule],
})
export class AutorModule {}
