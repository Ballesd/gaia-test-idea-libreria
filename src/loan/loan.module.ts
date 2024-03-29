import { Module } from '@nestjs/common';
import { LoanService } from './loan.service';
import { LoanController } from './loan.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  controllers: [LoanController],
  providers: [LoanService],
  imports: [PrismaModule],
})
export class LoanModule {}
