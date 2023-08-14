import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Post,
  Request,
  UseGuards,
} from '@nestjs/common';
import { AuthGuard, Public } from './auth.guard';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Public()
  @Post('login')
  @HttpCode(HttpStatus.OK)
  login(@Body() loginDto: Record<string, any>) {
    return this.authService.login(loginDto.username, loginDto.password);
  }

  @Public()
  @Post('register')
  @HttpCode(HttpStatus.OK)
  register(@Body() signInDto: Record<string, any>) {
    return this.authService.register(signInDto.username, signInDto.password);
  }

  @Post('testAuth')
  @HttpCode(HttpStatus.OK)
  testAuth() {
    return 'true';
  }
}
