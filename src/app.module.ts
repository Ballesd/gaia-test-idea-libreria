import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
import { LoanModule } from './loan/loan.module';
import { BookModule } from './book/book.module';
import { AutorModule } from './autor/autor.module';

@Module({
  imports: [UserModule, AutorModule, BookModule, LoanModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
